//
//  ActivityDetailView.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-07.
//

import SwiftUI

struct ActivityDetailsView: View {
    let activity:Activity
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(activity:  Activity(name: "Hello", description: "Hello Hiii", rating: 2.0, host: "dhsfdhs", photos: ["dfsfd", "fdsfd"], price: 23.99))
    }
}
