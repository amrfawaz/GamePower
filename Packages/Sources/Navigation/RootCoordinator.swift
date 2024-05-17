//
//  RootCoordinator.swift
//  
//
//  Created by AmrFawaz on 13/05/2024.
//

import SwiftUI
import App

public struct RootCoordinator: View {
    public init() {}

    public var body: some View {
        ZStack {
            currentCoordinator
        }
    }
}

private extension RootCoordinator {
    var currentCoordinator: some View {
        GiveawaysView()
    }
}
