//
//  Const.swift
//  Group11_Final
//
//  Created by Karan Meghani on 2023-03-08.
//

import Foundation

class DataSource{
    static let shared = DataSource()
    let activities:[Activity]
    let favorites:[UUID:[Activity]]
    
    private init(){
        favorites = [:]
        activities = [
            Activity(
                id: "A1",
                name: "Hello",
                description: "Hello Hiii",
                rating: 2.0,
                host: "dhsfdhs",
                photos: ["Activity1Image1", "Activity1Image1"],
                price: 23.99
            ),
            Activity(
                id: "A2",
                name: "Museum Visit",
                description: "Explore the exhibits and learn about the history and culture of the city.",
                rating: 4.5,
                host: "City Museum",
                photos: ["Activity1Image1", "Activity1Image1"],
                price: 20.0
            ),
            Activity(
                id: "A3",
                name: "Hello",
                description: "Hello Hiii",
                rating: 2.0,
                host: "dhsfdhs",
                photos: ["Activity1Image1", "Activity1Image1"],
                price: 23.99
            ),
            Activity(
                id: "A4",
                name: "Museum Visit",
                description: "Explore the exhibits and learn about the history and culture of the city.",
                rating: 4.5,
                host: "City Museum",
                photos: ["Activity1Image1", "Activity1Image1"],
                price: 20.0
            ),
            Activity(
                id: "A5",
                name: "Hello",
                description: "Hello Hiii",
                rating: 2.0,
                host: "dhsfdhs",
                photos: ["Activity1Image1", "Activity1Image1"],
                price: 23.99
            ),
        ]
    }
    
}
