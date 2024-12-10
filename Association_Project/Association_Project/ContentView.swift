//
//  ContentView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
        .accentColor(.purple) // Personnalisation de la couleur des onglets
    }
}

// Page "Home"
struct HomeView: View {
    var body: some View {
        VStack {
            Text("Bienvenue sur l'Accueil")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

// Page "Demande" avec les 4 options
struct DemandeView: View {
    var body: some View {
        VStack {
            Text("Association")
                .font(.title)
                .bold()
                .padding(.top, 20)
            
            GridView() // Affichage des 4 catégories
                .padding()
            
            Spacer()
        }
    }
}

struct GridView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            NavigationLink(destination: NutritionView()) {
                CategoryCard(imageName: "fork.knife", title: "Nutrition")
            }
            NavigationLink(destination: LogementView()) {
                CategoryCard(imageName: "bed.double", title: "Logement")
            }
            NavigationLink(destination: SanteView()) {
                CategoryCard(imageName: "stethoscope", title: "Santé")
            }
            NavigationLink(destination: VestimentaireView()) {
                CategoryCard(imageName: "tshirt", title: "Vestimentaire")
            }
        }
    }
}

struct CategoryCard: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.purple)
            Text(title)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

// Page "Localisation"
struct LocalisationView: View {
    var body: some View {
        VStack {
            Text("Localisation")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

// Page "Contact"
struct ContactView: View {
    var body: some View {
        VStack {
            Text("Contactez-nous")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

// Pages pour les catégories
struct NutritionView: View {
    var body: some View {
        Text("Page Nutrition")
            .font(.largeTitle)
    }
}

struct LogementView: View {
    var body: some View {
        Text("Page Logement")
            .font(.largeTitle)
    }
}

struct SanteView: View {
    var body: some View {
        Text("Page Santé")
            .font(.largeTitle)
    }
}

struct VestimentaireView: View {
    var body: some View {
        Text("Page Vestimentaire")
            .font(.largeTitle)
    }
}
