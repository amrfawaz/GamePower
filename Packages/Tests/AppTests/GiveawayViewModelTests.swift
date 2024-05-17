//
//  GiveawayViewModelTests.swift
//  
//
//  Created by AmrFawaz on 17/05/2024.
//

import XCTest
import App

@testable import App

class GiveawayViewModelTests: XCTestCase {

    // Mock Giveaway
    let mockGiveaway: Giveaway = .mockedGiveaway

    // Test Initialization
    func testInitialization() {
        // Given
        let mockGiveaway: Giveaway = .mockedGiveaway

        // When
        let sut = GiveawayViewModel(
            giveaway: mockGiveaway,
            cardType: .carousel
        )

        // Then
        XCTAssertEqual(sut.giveaway, mockGiveaway)
        XCTAssertEqual(sut.cardType, .carousel)
    }

    // Test giveawayStatus
    func testGiveawayStatusActive() {
        // Given
        let mockGiveaway: Giveaway = .mockedGiveaway
        let sut = GiveawayViewModel(
            giveaway: mockGiveaway,
            cardType: .carousel
        )

        // Then
        XCTAssertTrue(sut.giveawayStatus)
    }

    func testGiveawayStatusInactive() {
        // Given
        let inactiveGiveaway: Giveaway = .inactiveGiveaway
        let sut = GiveawayViewModel(
            giveaway: inactiveGiveaway,
            cardType: .carousel
        )

        // Then
        XCTAssertFalse(sut.giveawayStatus)
    }

    func testToggleStatusActiveToInactive() {
        // Given
        let mockGiveaway: Giveaway = .mockedGiveaway
        let sut = GiveawayViewModel(
            giveaway: mockGiveaway,
            cardType: .carousel
        )

        // When
        sut.toggelStatus()

        // Then
        XCTAssertEqual(sut.giveaway.status, "Inactive")
    }

    func testToggleStatusInactiveToActive() {
        // Given
        let inactiveGiveaway: Giveaway = .inactiveGiveaway
        let sut = GiveawayViewModel(
            giveaway: inactiveGiveaway,
            cardType: .carousel
        )

        // When
        sut.toggelStatus()

        // Then
        XCTAssertEqual(sut.giveaway.status, "Active")
    }
}

