//
//  GiveawayDetailsView.swift
//
//
//  Created by AmrFawaz on 17/05/2024.
//

import SwiftUI
import CoreInterface

struct GiveawayDetailsView: View {
    @ObservedObject var viewModel: GiveawayDetailsViewModel
    @Binding var path: NavigationPath

    public var body: some View {
        VStack(spacing: .zero) {
            // Top image with overlay
            ZStack(alignment: .topLeading) {
                // Background Image
                backgroundImage

                headerButtons
                    .padding()

                titleView
                    .padding()
            }
            .frame(height: Style.Size.giveawayDetailsImage)

            details
        }
        .navigationBarBackButtonHidden(true)
        Spacer()
    }

    

    var title: some View {
        Text(viewModel.giveaway.title)
            .typography(.heading02)
            .foregroundStyle(.white)
    }


    var heartButton: some View {
        Button(action: {
            viewModel.toggelStatus()
        }) {
            Image(systemName: viewModel.giveawayStatus ? "heart.fill" : "heart")
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }

    var features: some View {
        HStack {
            VStack {
                Image(systemName: "dollarsign.square.fill")
                Text(viewModel.giveaway.worth)
                    .typography(.button01)
            }
            Spacer()
            VStack {
                Image(systemName: "person.2.fill")
                Text("\(viewModel.giveaway.users)")
                    .typography(.button01)
            }
            Spacer()
            VStack {
                Image(systemName: "gamecontroller.fill")
                Text(viewModel.giveaway.type)
                    .typography(.button01)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


// MARK: - Top Image View
extension GiveawayDetailsView {
    var backgroundImage: some View {
        AsyncImage(
            url: URL(
                string: viewModel.giveaway.image
            )
        ) { image in
            image.resizable()
        } placeholder: {
            Color.gray
        }
    }

    var headerButtons: some View {
        HStack {
            backButton
            
            Spacer()
            
            heartButton
        }
    }

    var backButton: some View {
        Button(action: {
            path.removeLast()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }

    var titleView: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack(alignment: .center) {
                title

                Spacer()

                Button(action: {
                    // Get it button action
                }) {
                    Text("Get it")
                        .foregroundColor(.black)
                        .padding(.horizontal, Style.Spacing.md)
                        .padding(.vertical, Style.Spacing.xxs)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

// MARK: - Details View

extension GiveawayDetailsView {
    var details: some View {
        VStack(alignment: .leading, spacing: Style.Spacing.lg) {
            // Stats row
            features

            platforms

            endDate

            description
        }
        .padding()
    }

    var platforms: some View {
        VStack(alignment: .leading, spacing: Style.Spacing.xxs) {
            Text("Platforms")
                .font(.headline)
            Text(viewModel.giveaway.platforms)
                .typography(.body01)
                .foregroundColor(.gray)
        }
    }

    var endDate: some View {
        VStack(alignment: .leading, spacing: Style.Spacing.xxs) {
            Text("Giveaway End Date")
                .font(.headline)
            Text(viewModel.giveaway.endDate)
                .typography(.body01)
                .foregroundColor(.gray)
        }
    }

    var description: some View {
        VStack(alignment: .leading, spacing: Style.Spacing.xxs) {
            Text("Description")
                .font(.headline)
            Text(viewModel.giveaway.description)
                .typography(.body01)
                .foregroundColor(.gray)
        }
    }
}
