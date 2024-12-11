//
//  MaterialDonView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

import SwiftUI

struct MaterialDonView: View {
    var onBack: () -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // En-tête
                HStack {
                    Button(action: {
                        onBack()
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
                .background(Color.orange)

                Text("Faire un Don Matériel")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                
                // Description
                Text("Contribuez en envoyant des vêtements, des couvertures, des produits d'hygiène ou des jouets via les adresses et associations ci-dessous.")
                    .font(.body)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                // Section : Adresses postales
                SectionView(
                    title: "Adresses pour envoyer vos dons",
                    description: "Envoyez vos dons directement aux adresses suivantes :",
                    content: [
                        "Les Restos du Cœur: 45 Rue de l'Avenir, 75000 Paris",
                        "Emmaüs: 22 Allée des Solidaires, 69000 Lyon",
                        "La Croix-Rouge: 10 Boulevard de l'Espoir, 13000 Marseille",
                        "Secours Populaire: 8 Place de la Fraternité, 33000 Bordeaux"
                    ],
                    isLink: false
                )
                
                // Points de Collecte
                VStack {
                    Text("Déposez vos dons près de chez vous")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    Button(action: {
                        // Action pour afficher une carte ou une liste des points de collecte
                        print("Afficher les points de collecte")
                    }) {
                        Text("Voir les points de collecte")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal)
                
                // Plateformes en ligne
                SectionView(
                    title: "Partagez vos dons en ligne",
                    description: "Utilisez ces plateformes pour donner directement vos objets :",
                    content: [
                        "https://www.geev.com",
                        "https://www.leboncoin.fr"
                    ],
                    isLink: true
                )
            }
            .padding()
        }
        .background(Color(.systemGray6))
    }
}
struct SectionView: View {
    let title: String
    let description: String
    let content: [String] // Contient soit les adresses, soit les descriptions des liens
    let isLink: Bool // Si `true`, le contenu est interprété comme des liens

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.orange)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            ForEach(content, id: \.self) { item in
                if isLink, let url = URL(string: item) {
                    Link(item, destination: url)
                        .font(.body)
                        .foregroundColor(.blue)
                } else {
                    Text(item)
                        .font(.body)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


#Preview {
    MaterialDonView {
        print("Retour à l'écran précédent")
    }
}
