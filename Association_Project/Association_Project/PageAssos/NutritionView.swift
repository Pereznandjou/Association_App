//
//  NutritionView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI
import MapKit

struct NutritionView: View {
    let nutritionServices = [
        ("Les Restos du Cœur", "restos_du_coeur", [
            Location(name: "Restos du Cœur Lyon", address: "10 Rue Exemple, Lyon"),
            Location(name: "Restos du Cœur Paris", address: "20 Avenue Exemple, Paris")
        ]),
        ("Banque Alimentaire", "banque_alimentaire", [
            Location(name: "Banque Alimentaire Bordeaux", address: "15 Rue Exemple, Bordeaux"),
            Location(name: "Banque Alimentaire Lille", address: "25 Avenue Exemple, Lille")
        ]),
        ("Secours Populaire", "secours_populaire", [
            Location(name: "Secours Populaire Marseille", address: "30 Rue Exemple, Marseille")
        ]),
        ("Emmaüs Solidarité", "emmaus_solidarite", [
            Location(name: "Emmaüs Solidarité Nice", address: "35 Avenue Exemple, Nice")
        ])
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.purple.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                List(nutritionServices, id: \.0) { service in
                    NavigationLink(destination: ServiceDetailView(serviceName: service.0, imageName: service.1, locations: service.2)) {
                        HStack {
                            Image(service.1)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                                .clipped()
                            
                            Text(service.0)
                                .font(.headline)
                                .padding(.leading, 10)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                }
                .navigationTitle("Services Nutrition")
                .navigationBarTitleDisplayMode(.inline) // Cela supprime le titre redondant dans la vue de détail
            }
        }
    }
}

struct ServiceDetailView: View {
    var serviceName: String
    var imageName: String
    var locations: [Location]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), // Default: Paris
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .cornerRadius(15)
                    .clipped()
                    .shadow(radius: 10)
                
                Text(serviceName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .padding(.top)
                
                Text("Voici les emplacements des \(serviceName) proches de chez vous.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding()
                
                // Liste des emplacements
                ForEach(locations, id: \.name) { location in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(location.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                        Text(location.address)
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                    }
                    .padding(.horizontal)
                }
                
                // Carte interactive
                Map(coordinateRegion: $region, annotationItems: locations) { location in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: randomLatitude(), longitude: randomLongitude()), tint: .blue)
                }
                .frame(height: 300)
                .cornerRadius(15)
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle(serviceName)
        .navigationBarTitleDisplayMode(.inline) // Affiche le titre de la page de détail
    }
    
    // Simule des coordonnées aléatoires (remplacer par des vraies coordonnées)
    func randomLatitude() -> Double {
        return region.center.latitude + Double.random(in: -0.05...0.05)
    }
    
    func randomLongitude() -> Double {
        return region.center.longitude + Double.random(in: -0.05...0.05)
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let address: String
}

#Preview {
    NutritionView()
}
