//
//  DonView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct DonView: View {
    @State private var showMonetaryDon = false
    @State private var showMaterialDon = false
    var onBack: () -> Void

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                // Header avec bouton de retour
                HStack {
                    Button(action: {
                        onBack()
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()

                // Titre principal
                Text("Choisissez le type de don")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Spacer()

                // Boutons pour choisir le type de don
                VStack(spacing: 20) {
                    Button(action: {
                        showMonetaryDon = true
                    }) {
                        Text("Don Monétaire")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    .fullScreenCover(isPresented: $showMonetaryDon) {
                        MonetaryDonView(onBack: {
                            showMonetaryDon = false
                        })
                    }

                    Button(action: {
                        showMaterialDon = true
                    }) {
                        Text("Don Matériel")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    .fullScreenCover(isPresented: $showMaterialDon) {
                        MaterialDonView(onBack: {
                            showMaterialDon = false
                        })
                    }
                }

                Spacer()

                // Footer
                Text("Merci pour votre soutien!")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
    }
}
