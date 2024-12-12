//
//  LogementView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI
import MapKit

struct LogementView: View {
    let logementServices = [
        ("Société Saint Vincent de Paul", "societe_saint_vincent_de_paul", [
            Location(name: "Société Saint Vincent de Paul Lyon", address: "12 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "Société Saint Vincent de Paul Paris", address: "22 Rue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Société Saint Vincent de Paul Lille", address: "32 Rue Exemple, Lille", coordinate: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573))
        ]),
        ("Secours Islamique France (SIF)", "sif", [
            Location(name: "SIF Marseille", address: "15 Rue Exemple, Marseille", coordinate: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698)),
            Location(name: "SIF Lyon", address: "25 Rue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357)),
            Location(name: "SIF Bordeaux", address: "35 Rue Exemple, Bordeaux", coordinate: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792))
        ]),
        ("Abribus Solidarité", "abribus", [
            Location(name: "Abribus Solidarité Nice", address: "18 Avenue Exemple, Nice", coordinate: CLLocationCoordinate2D(latitude: 43.7102, longitude: 7.2620)),
            Location(name: "Abribus Solidarité Paris", address: "28 Avenue Exemple, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
            Location(name: "Abribus Solidarité Lyon", address: "38 Avenue Exemple, Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357))
        ])
    ]
    
    var body: some View {
        
    
            ZStack {
                // Fond dégradé
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.green.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Image principale
                    Image("log")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    // Liste des services
                    List {
                        ForEach(logementServices, id: \.0) { service in
                            NavigationLink {
                                // Vue détaillée
                                ServiceDetailView(
                                    serviceName: service.0,
                                    imageName: service.1,
                                    locations: service.2
                                )
                            } label: {
                                HStack {
                                    Image(service.1)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                    
                                    Text(service.0)
                                        .font(.headline)
                                        .padding(.leading, 10)
                                }
                            }
                            .listRowBackground(Color.clear) // Supprime le fond blanc des cellules
                        }
                    }
                    .scrollContentBackground(.hidden) // Supprime le fond par défaut de la liste
                    .background(Color.clear)
                }
                .navigationTitle("Services Logement")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top, 10)

        }
    }
}

#Preview {
    LogementView()
}
