//
//  ContentView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Dégradé de fond
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.pink]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                // Logo de l'association
                VStack {
                    Image(systemName: "hands.sparkles") // Vous pouvez remplacer par une image personnalisée
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    
                    Text("MAIN TENDUE ASSOCIATION")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                
                // Boutons
                HStack(spacing: 20) {
                    // Bouton "J’ai besoin"
                    Button(action: {
                        print("J’ai besoin tapped")
                    }) {
                        VStack {
                            Image(systemName: "hand.raised.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                            Text("J’ai besoin")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                        .frame(width: 120, height: 120)
                        .background(Color.yellow)
                        .cornerRadius(10)
                    }
                    
                    // Bouton "Je donne"
                    Button(action: {
                        print("Je donne tapped")
                    }) {
                        VStack {
                            Image(systemName: "gift.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                            Text("Je donne")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                        .frame(width: 120, height: 120)
                        .background(Color.yellow)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
