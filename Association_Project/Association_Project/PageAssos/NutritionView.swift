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
            Location(name: "Restos du Cœur Lyon", address: "10 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Restos du Cœur Paris", address: "20 Rue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Restos du Cœur Lille", address: "30 Rue Exemple, Lille", coordinate: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573))
        ]),
        ("Banque Alimentaire", "banque_alimentaire", [
            Location(name: "Banque Alimentaire Bordeaux", address: "15 Rue Exemple, Bordeaux", coordinate: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792)),
            Location(name: "Banque Alimentaire Lyon", address: "25 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Banque Alimentaire Marseille", address: "35 Rue Exemple, Marseille", coordinate: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698))
        ]),
        ("Secours Populaire", "secours_populaire", [
            Location(name: "Secours Populaire Marseille", address: "30 Rue Exemple, Marseille", coordinate: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698)),
            Location(name: "Secours Populaire Lyon", address: "40 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Secours Populaire Lille", address: "50 Rue Exemple, Lille", coordinate: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573))
        ]),
        ("Emmaüs Solidarité", "emmaus_solidarite", [
            Location(name: "Emmaüs Solidarité Nice", address: "35 Avenue Exemple, Nice", coordinate: CLLocationCoordinate2D(latitude: 43.7102, longitude: 7.2620)),
            Location(name: "Emmaüs Solidarité Paris", address: "45 Avenue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Emmaüs Solidarité Lyon", address: "55 Avenue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357))
        ])
    ]
    
    var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange.opacity(0.6), Color.purple.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Image principale
                    Image("nut")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    // Liste des services
                    List {
                        ForEach(nutritionServices, id: \.0) { service in
                            NavigationLink(destination: ServiceDetailView(serviceName: service.0, imageName: service.1, locations: service.2)) {
                                HStack {
                                    Image(service.1)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                    
                                    Text(service.0)
                                        .font(.headline)
                                        .padding(.leading, 10)
                                        .foregroundColor(.white)
                                }
                            }
                            .listRowBackground(Color.clear) // Supprime le fond blanc
                        }
                    }
                    .scrollContentBackground(.hidden) // Supprime le fond par défaut de la liste
                }
                .navigationTitle("Services Nutrition")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top, 10)

        }
    }
}

struct ServiceDetailView: View {
    var serviceName: String
    var imageName: String
    var locations: [Location]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357), // Default: Lyon
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Link(destination: URL(string: "https://maps.apple.com/?q=\(serviceName.replacingOccurrences(of: " ", with: "+"))")!) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .cornerRadius(15)
                        .clipped()
                        .shadow(radius: 10)
                }
                
                Text(serviceName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top)
                
                Text("Découvrez les lieux offrant des services de \(serviceName) près de chez vous. Ces organisations jouent un rôle clé dans la lutte contre la précarité alimentaire.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding()
                
                ForEach(locations, id: \.id) { location in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(location.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Link(destination: URL(string: "https://maps.google.com/?q=\(location.address.replacingOccurrences(of: " ", with: "+"))")!) {
                            Text(location.address)
                                .font(.body)
                                .foregroundColor(.blue)
                                .underline()
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(.horizontal)
                }
                
                Map(coordinateRegion: $region, annotationItems: locations) { location in
                    MapMarker(coordinate: location.coordinate, tint: .blue)
                }
                .frame(height: 300)
                .cornerRadius(15)
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle(serviceName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    NutritionView()
}
