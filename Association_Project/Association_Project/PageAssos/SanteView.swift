//
//  SanteView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI
import MapKit

struct SanteView: View {
    let santeServices = [
        ("Secours Catholique", "secours_catholique", [
            Location(name: "Secours Catholique Lyon", address: "10 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Secours Catholique Paris", address: "20 Rue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Secours Catholique Lille", address: "30 Rue Exemple, Lille", coordinate: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573))
        ]),
        ("Croix Rouge", "croix_rouge", [
            Location(name: "Croix Rouge Marseille", address: "15 Rue Exemple, Marseille", coordinate: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698)),
            Location(name: "Croix Rouge Lyon", address: "25 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Croix Rouge Bordeaux", address: "35 Rue Exemple, Bordeaux", coordinate: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792))
        ]),
        ("Medical Solidaire", "sante 1", [
            Location(name: "Medical Solidaire Nice", address: "40 Avenue Exemple, Nice", coordinate: CLLocationCoordinate2D(latitude: 43.7102, longitude: 7.2620)),
            Location(name: "Medical Solidaire Paris", address: "50 Avenue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Medical Solidaire Lyon", address: "60 Avenue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357))
        ])
    ]
    
    var body: some View {
//        NavigationView {
            ZStack {
                LinearGradient(
                        gradient: Gradient(colors: [Color.green.opacity(0.7), Color.white.opacity(0.9)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Image principale
                    Image("sante")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    // Liste des services
                    List {
                        ForEach(santeServices, id: \.0) { service in
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
                .navigationTitle("Services Santé")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top, 10)
            }
//        }
    }
}

#Preview {
    SanteView()
}
