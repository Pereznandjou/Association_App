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
    @State private var places: [Place] = [] // Liste des lieux trouvés
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(
                    coordinateRegion: $locationManager.region,
                    showsUserLocation: true,
                    annotationItems: places
                ) { place in
                    MapMarker(coordinate: place.coordinate, tint: .orange)
                }
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
            .onChange(of: locationManager.region.center) { newCenter in
                fetchNearbyPlaces()
            }
            .navigationTitle("Localisation")
        }
    }
    
    /// Recherche les lieux proches en fonction de la position actuelle
    private func fetchNearbyPlaces() {
        guard let userLocation = locationManager.currentLocation else { return }
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "restaurant OR logement"
        searchRequest.region = MKCoordinateRegion(
            center: userLocation.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            if let error = error {
                print("Erreur lors de la recherche : \(error.localizedDescription)")
                return
            }
            
            guard let mapItems = response?.mapItems else { return }
            DispatchQueue.main.async {
                places = mapItems.map { Place(placemark: $0.placemark) }
            }
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
    var currentLocation: CLLocation? // Stocke la position actuelle

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
                self.currentLocation = location
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

/// Représente un lieu avec ses coordonnées
struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    init(placemark: MKPlacemark) {
        self.name = placemark.name ?? "Inconnu"
        self.coordinate = placemark.coordinate
    }
}

// Extension pour rendre CLLocationCoordinate2D conforme à Equatable
extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
