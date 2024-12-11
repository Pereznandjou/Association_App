//
//  ContentView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showWelcomeScreen = true // État pour afficher ou masquer le fullScreenCover
    @State private var isInDonView = false // État pour vérifier si on est sur DonView

    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray6 // Change la couleur de fond de la barre des onglets
    }
    
    var body: some View {
        ZStack {
            if isInDonView {
                DonView(onBack: {
                    // Actions à effectuer lors du retour
                    showWelcomeScreen = true
                    isInDonView = false
                })

            } else {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    
                    DemandeView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Demande")
                        }
                    
                    LocalisationView()
                        .tabItem {
                            Image(systemName: "map")
                            Text("Localisation")
                        }
                    
                    ContactView()
                        .tabItem {
                            Image(systemName: "phone")
                            Text("Contact")
                        }
                }
                .accentColor(.purple)
                .onAppear {
                    UITabBar.appearance().unselectedItemTintColor = UIColor.gray
                }
                .fullScreenCover(isPresented: $showWelcomeScreen) {
                    WelcomeScreen(
                        onClose: {
                            showWelcomeScreen = false
                        },
                        onNavigateToDonView: {
                            showWelcomeScreen = false
                            isInDonView = true
                        }
                    )
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
