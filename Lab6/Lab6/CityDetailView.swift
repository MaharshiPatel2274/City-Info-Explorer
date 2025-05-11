//
//  CityDetailView.swift
//  Lab6
//
//  Created by mpate125 on 3/20/25.
//

import SwiftUI
import MapKit


struct Lab8CitiesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct CityDetailView: View {
    let city: City
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    )
    
    var body: some View {
        VStack(spacing: 0) {
            // City info
            Text(city.name)
                .font(.largeTitle)
                .padding(.vertical)
            
            Text("Country: \(city.countrycode)")
                .font(.headline)
            Text("Population: \(city.population)")
                .font(.subheadline)
                .padding(.bottom)
            
            // Map
            Map(coordinateRegion: $region, annotationItems: [city]) { city in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: city.lat, longitude: city.lng))
            }
            .onAppear {
                // Center on the city
                region.center = CLLocationCoordinate2D(latitude: city.lat, longitude: city.lng)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

