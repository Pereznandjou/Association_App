//
//  VestimentaireView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI
import MapKit

struct VestimentaireView: View {
    let vestimentaireServices = [
        ("Vêtements Publicitaires", "vetement_publicitaire", [
            Location(name: "Publicitaires Paris", address: "10 Rue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Publicitaires Lyon", address: "20 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Publicitaires Marseille", address: "30 Rue Exemple, Marseille", coordinate: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698))
        ]),
        ("La Cravate Solidaire", "la_cravatte_solitaire", [
            Location(name: "Cravate Paris", address: "15 Rue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Cravate Lyon", address: "25 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Cravate Bordeaux", address: "35 Rue Exemple, Bordeaux", coordinate: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792))
        ]),
        ("Saint James", "saint_james", [
            Location(name: "Saint James Paris", address: "40 Rue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Saint James Lille", address: "50 Rue Exemple, Lille", coordinate: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573)),
            Location(name: "Saint James Lyon", address: "60 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357))
        ])
    ]
    
    var body: some View {
//        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.gray.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Image principale
                    Image("vet")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    // Liste des services
                    List {
                        ForEach(vestimentaireServices, id: \.0) { service in
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
                .navigationTitle("Services Vestimentaires")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top, 10)
//            }
        }
    }
}

#Preview {
    VestimentaireView()
}
