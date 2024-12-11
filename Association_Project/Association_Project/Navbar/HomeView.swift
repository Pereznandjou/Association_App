//
//  SwiftUIView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var navigateToWelcome = false
    @State private var isNavigatingToDon = false // État pour gérer la navigation vers "Je donne"
    
    var body: some View {
        ZStack {
            // Affiche le contenu de HomeView si on n'est pas en train de naviguer vers "Je donne"
            if !isNavigatingToDon {
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            navigateToWelcome.toggle()
                        }) {
                            Image(systemName: "power")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(Circle().fill(Color.black.opacity(0.6)))
                        .padding(.top, 40)
                        .padding(.leading, 20)
                        .fullScreenCover(isPresented: $navigateToWelcome) {
                            WelcomeScreen(
                                onClose: {
                                    navigateToWelcome = false
                                },
                                onNavigateToDonView: {
                                    navigateToWelcome = false
                                    isNavigatingToDon = true // Lorsque vous naviguez vers "Je donne"
                                }
                            )
                        }
                        
                        Spacer()
                    }
                    
                    Text("Bienvenue sur notre site pour les sans-abris !")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Nous sommes là pour vous aider.")
                        .font(.title2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                }
                .padding()
            }
            
            // Affiche DonView uniquement si isNavigatingToDon est true
            if isNavigatingToDon {
                DonView(onBack: {
                    // Lorsque l'utilisateur revient de la vue DonView
                    isNavigatingToDon = false
                })
                .transition(.move(edge: .bottom)) // Transition si nécessaire
            }
        }
    }
}


#Preview {
    HomeView()
}
