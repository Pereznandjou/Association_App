//
//  LocalisationView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//
// NSLocationWhenInUseUsageDescription
// NSLocationAlwaysUsageDescription

import SwiftUI
import MapKit
import CoreLocation

struct LocalisationView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(
                    coordinateRegion: $locationManager.region,
                    showsUserLocation: true
                )
                .edgesIgnoringSafeArea(.all)
                
                // Indicateur de chargement si la localisation est en attente
                if locationManager.isLoading {
                    ProgressView("Obtention de votre position...")
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                }
            }
            .onAppear {
                locationManager.requestLocation()
            }
            .navigationTitle("Localisation")
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), // Par défaut : Paris
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @Published var isLoading = true

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        if CLLocationManager.locationServicesEnabled() {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            print("Les services de localisation sont désactivés.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Nouvelle position : \(location.coordinate.latitude), \(location.coordinate.longitude)")
            DispatchQueue.main.async {
                self.region.center = location.coordinate
                self.isLoading = false
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erreur de localisation : \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
