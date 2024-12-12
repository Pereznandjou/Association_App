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
                .frame(width: 150, height: 150)
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
        
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

#Preview {
    CategoryCard(imageName: "nut", title: "Nutrition")
}

