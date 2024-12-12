//
//  ContentView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentView: ViewType = .welcome // État global pour suivre la vue courante

    enum ViewType {
        case welcome
        case home
        case demande
        case localisation
        case contact
        case don
    }

    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray6 // Change la couleur de fond de la barre des onglets
    }

    var body: some View {
        ZStack {
            switch currentView {
            case .don:
                DonView(onBack: {
                    currentView = .welcome // Revenir à WelcomeScreen
                })
            case .welcome:
                WelcomeScreen(
                    onClose: {
                        currentView = .home // Retour à la vue d'accueil (par exemple)
                    },
                    onNavigateToDonView: {
                        currentView = .don // Aller à DonView
                    }
                )
            default:
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                        

                    DemandeView()
                        .tabItem {
                            Image(systemName: "square.grid.2x2.fill")
                            Text("Demande")
                        }
                        
                    LocalisationView()
                        .tabItem {
                            Image(systemName: "mappin.and.ellipse")
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
            }
        }
    }
}

#Preview {
    ContentView()
}
