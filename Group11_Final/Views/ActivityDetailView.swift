//
//  ActivityDetailView.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-07.
//

import SwiftUI
import UIKit

struct ActivityDetailsView: View {
    let activity: Activity
    @State private var isFavourite: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(activity.name)
                        .font(.title)
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < Int(activity.rating) ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    Text(activity.host)
                        .font(.subheadline)
                    Text(activity.description)
                        .font(.body)
                    Text("$\(activity.price, specifier: "%.2f") per person")
                        .font(.headline)
                }
                .padding(.horizontal)
                HStack(spacing: 20) {
//                    Button(action: {
//                        // Add activity to favorites
//                    }) {
//                        Image(systemName: "heart")
//                            .foregroundColor(.red)
//                        Text("Add to favorites")
//                            .foregroundColor(.primary)
//                    }
                    Button(action: {
                        
                        FavouritesManager.shared.addToFavourites(actvityId: activity.id)
                        isFavourite = !isFavourite

                            
                    }) {
                        if(isFavourite){
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }else{
                            Image(systemName: "heart")
                                .foregroundColor(.red)
                        }

                    }.onAppear(perform: {isFavourite = FavouritesManager.shared.checkIfFavourite(activityId: activity.id)
})

                }
                .padding(.horizontal)
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
            Button(action: {
                //Share
            let textToShare = "\(activity.name) Price: $\(String(format: "%.2f",activity.price))"
            let av = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
            }) {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.primary)
            }
        )
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(activity:  Activity(id: "A1", name: "Hello", description: "Hello Hiii", rating: 2.0, host: "dhsfdhs", photos: ["dfsfd", "fdsfd"], price: 23.99))
    }
}
