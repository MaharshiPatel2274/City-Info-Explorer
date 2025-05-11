//
//  CityViewModel.swift
//  Lab6
//
//  Created by mpate125 on 3/20/25.
//


import SwiftUI

class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var errorMessage: String? = nil
    

    private let north: Double = 44.1
    private let south: Double = -9.9
    private let east: Double = -22.4
    private let west: Double = 55.2

    private let username = "maharshi2004"
    
    func fetchCities() {

        let urlString = """
            https://secure.geonames.org/citiesJSON?north=\(north)\
            &south=\(south)&east=\(east)&west=\(west)\
            &maxRows=20&username=\(username)
            """
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.errorMessage = "Invalid URL"
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            // Check for a networking error
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Network error: \(error.localizedDescription)"
                }
                return
            }
            
            // Check the HTTP response code
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                DispatchQueue.main.async {
                    self.errorMessage = "HTTP Error: \(httpResponse.statusCode)"
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data returned from server."
                }
                return
            }
            
           
            do {
                let decoded = try JSONDecoder().decode(GeoNamesResponse.self, from: data)
                
                let limitedCities = Array(decoded.geonames.prefix(10))
                
                DispatchQueue.main.async {
                    self.cities = limitedCities
                    self.errorMessage = nil
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "JSON decode error: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}

// JSON structure with "geonames" array
struct GeoNamesResponse: Codable {
    let geonames: [City]
}

