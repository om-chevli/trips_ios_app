//
//  ActivitiesView.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-06.
//

import SwiftUI

struct ActivitiesView: View {
    let activities: [Activity]
    @State private var searchText = ""

    var body: some View {
        NavigationView{
            VStack {
                //            SearchBar(text: $searchText, placeholder: "Search activities")
                
                List {
                    ForEach(activities){ activity in
                        NavigationLink(destination: ActivityDetailsView(activity: activity)) {
                            ActivityRowView(activity: activity)
                        }
                    }
                }
            }
            .navigationBarTitle("Activities")
        }
    }
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
    }//VStack
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(activities: [
            Activity(name: "Hello", description: "Hello Hiii", rating: 2.0, host: "dhsfdhs", photos: ["Activity1Photo1","Activity1Photo1" ], price: 23.99)
        ])
    }
}

//struct SearchBar: View {
//    @Binding var text: String
//    var placeholder: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//            TextField(placeholder, text: $text)
//                .foregroundColor(.primary)
//            if !text.isEmpty {
//                Button(action: {
//                    self.text = ""
//                }) {
//                    Image(systemName: "xmark.circle.fill")
//                }
//            }
//        }
//        .padding(.horizontal)
//        .foregroundColor(.secondary)
//        .background(Color(.secondarySystemBackground))
//        .cornerRadius(10)
//    }
//}

