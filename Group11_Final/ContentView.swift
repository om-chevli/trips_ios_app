//
//  ContentView.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ActivitiesView()
                .tabItem {
                    Image(systemName: "figure.outdoor.cycle")
                    Text("Activities")
                }
            
            FavouritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
