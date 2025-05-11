//
//  City.swift
//  Lab6
//
//  Created by mpate125 on 3/20/25.
//

// City.swift
import Foundation

struct City: Identifiable, Codable {
    var id: Int { geonameId }

    let geonameId: Int
    let name: String
    let countrycode: String
    let population: Int
    let lat: Double
    let lng: Double
}
