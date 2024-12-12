//
//  DemandeView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct DemandeView: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Dégradé de fond
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    // Image de solidarité tout en haut
                    Image("association_main_tendue")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    // Texte explicatif
                    Text("Explorez les différentes catégories pour trouver l'aide qui correspond le mieux à vos besoins.")
                        .font(.title2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    
                    // Grille des catégories avec espacement ajusté
                    LazyVGrid(columns: columns, spacing: 20) {
                        NavigationLink(destination: NutritionView()) {
                            CategoryCard(imageName: "nut", title: "Nutrition")
                        }
                        NavigationLink(destination: LogementView()) {
                            CategoryCard(imageName: "log", title: "Logement")
                        }
                        NavigationLink(destination: SanteView()) {
                            CategoryCard(imageName: "sante", title: "Santé")
                        }
                        NavigationLink(destination: VestimentaireView()) {
                            CategoryCard(imageName: "vet", title: "Vestimentaire")
                        }
                    }
//                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle("Demande d'Aide")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DemandeView()
}
