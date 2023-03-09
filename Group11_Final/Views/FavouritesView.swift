//
//  FavouritesView.swift
//  Group11_Final
//
//  Created by Karan Meghani on 2023-03-08.
//

import SwiftUI

struct FavouritesView: View {
    let favouritesManager = FavouritesManager()
    @State private var userFavourites:[Activity] = []
    var body: some View {
        NavigationView{
            VStack {
                //            SearchBar(text: $searchText, placeholder: "Search activities")

                List {
                    if(userFavourites.isEmpty){
                        Text("No Favourites added yet.").font(.callout .bold())
                    }
                    ForEach(userFavourites){ activity in
                        NavigationLink(destination: ActivityDetailsView(activity: activity)) {
                            ActivityRowView(activity: activity)
                                
                        }
                    }.onDelete(perform: deleteFavourite)

                }
                .onAppear(){
                    userFavourites = favouritesManager.getUserFavourites()
                }
            }
            .navigationBarTitle("Favourites")
        }
    }
    
    func deleteFavourite(at offsets: IndexSet){
        offsets.forEach { index in
            let activity = userFavourites[index]
            favouritesManager.deleteFromFavourites(activityId: activity.id)
        }
        userFavourites.remove(atOffsets: offsets)
    }
    
    struct ActivityRowView: View {
        let activity: Activity
        @State private var selectedTab = 0
        
        var body: some View {
            HStack {
                
                Image(activity.photos[0])
                    .resizable()
                    .frame(width: 70, height: 80)
                    .scaledToFill()
                
                VStack(alignment: .leading){
                    Text(activity.name)
                        .font(.headline)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                    let priceString = "Price: $\(activity.price) / person"
                    
                    Text(priceString)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}


struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
