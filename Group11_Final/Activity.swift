//
//  Activity.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-06.
//

import Foundation

class Activity: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let rating: Double
    let host: String
    let photos: [String]
    let price: Double
    
    init(name: String, description: String, rating: Double, host: String, photos: [String], price: Double) {
        self.name = name
        self.description = description
        self.rating = rating
        self.host = host
        self.photos = photos
        self.price = price
    }
}
