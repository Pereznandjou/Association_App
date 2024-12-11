//
//  CategoryCard.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct CategoryCard: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            // Image de la catégorie
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .clipped()
            
            // Titre de la catégorie
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 10)
                .shadow(radius: 5)
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

#Preview {
    CategoryCard(imageName: "nut", title: "Nutrition")
}

