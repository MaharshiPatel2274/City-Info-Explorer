//
//  ContentView.swift
//  Lab6
//
//  Created by mpate125 on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CityViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Error message if any
                if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                
                List(viewModel.cities) { city in
                    NavigationLink(destination: CityDetailView(city: city)) {
                        // Display city name, country, population
                        VStack(alignment: .leading) {
                            Text(city.name)
                                .font(.headline)
                            Text("Country: \(city.countrycode)")
                                .font(.subheadline)
                            Text("Population: \(city.population)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("City List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fetch") {
                        viewModel.fetchCities()
                    }
                }
            }
            .onAppear {
                
                viewModel.fetchCities()
            }
        }
    }
}

