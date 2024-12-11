//
//  WelcomeScreen.swift
//  MyFirst
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct WelcomeScreen: View {
    var onClose: () -> Void
    var onNavigateToDonView: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.purple]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                VStack(spacing: 16) {
                    Image(systemName: "hands.sparkles")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    
                    Text("MAIN TENDUE ASSOCIATION")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                
                Spacer()
                
                // Boutons
                HStack(spacing: 20) {
                    Button(action: {
                        // Action pour "J'ai besoin"
                        onClose()
                    }) {
                        VStack {
                            Image(systemName: "questionmark.square.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                            Text("J’ai besoin")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .frame(width: 120, height: 120)
                        .background(Color.yellow)
                        .cornerRadius(12)
                    }
                    
                    Button(action: {
                        // Action pour "Je donne"
                        onNavigateToDonView()
                    }) {
                        VStack {
                            Image(systemName: "gift.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                            Text("Je donne")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .frame(width: 120, height: 120)
                        .background(Color.yellow)
                        .cornerRadius(12)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
