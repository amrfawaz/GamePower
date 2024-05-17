//
//  GiveawaysViewModelTests.swift
//  
//
//  Created by AmrFawaz on 17/05/2024.
//

import XCTest
import App

@testable import App

final class GiveawaysViewModelTests: XCTestCase {
    
    var sut: GiveawaysViewModel!
    var mockService: MockGiveawaysService!
    
    override func setUp() {
        super.setUp()
        mockService = MockGiveawaysService()
        sut = GiveawaysViewModel(services: mockService)
    }
    
    override func tearDown() {
        sut = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchGiveawaysSuccess() async {
        // Given
        let expectedGiveaways = [Giveaway.mockedGiveaway]
        mockService.result = .success(expectedGiveaways)
        
        // When
        await sut.fetchGiveaways()
        
        // Then
        XCTAssertEqual(sut.giveaways, expectedGiveaways)
        XCTAssertEqual(sut.platforms, ["DRM-Free", "PC"])
    }
    
    func testFetchGiveawaysFailure() async {
        // Given
        mockService.result = .failure(NSError(domain: "", code: -1, userInfo: nil))
        
        // When
        await sut.fetchGiveaways()
        
        // Then
        XCTAssertTrue(sut.giveaways.isEmpty)
    }
    
    func testFilterWithSelectedPlatform() {
        // Given
        sut.giveaways = Giveaway.mockedGiveaways
        
        sut.selectedPlatform = "Epic Games Store"
        
        // When
        let filteredGiveaways = sut.filter()
        
        // Then
        XCTAssertEqual(filteredGiveaways.count, 2)
    }
    
    func testFilterWithoutSelectedPlatform() {
        // Given
        sut.giveaways = Giveaway.mockedGiveaways
        sut.selectedPlatform = ""
        
        // When
        let filteredGiveaways = sut.filter()
        
        // Then
        XCTAssertEqual(filteredGiveaways.count, 5)
    }
    
    func testDidTapPlatform() {
        // Given
        let platform = "PC"
        
        // When
        sut.didTapPlatform(platform: platform)
        
        // Then
        XCTAssertEqual(sut.selectedPlatform, platform)
    }
}

// Mock service to use in tests
class MockGiveawaysService: GiveawaysService {
    var result: Result<[Giveaway], Error>!

    func fetchGiveaways() async -> Result<[Giveaway], Error> {
        return result
    }
}
