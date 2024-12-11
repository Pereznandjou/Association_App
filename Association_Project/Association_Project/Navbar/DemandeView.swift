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
        NavigationStack { // Utilisation de NavigationStack pour gérer la pile de navigation correctement
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
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
                .padding()
            }
        }
        .navigationTitle("Demande d'Aide")
        .navigationBarTitleDisplayMode(.inline) // Mode de titre simplifié
    }
}

#Preview {
    DemandeView()
}


