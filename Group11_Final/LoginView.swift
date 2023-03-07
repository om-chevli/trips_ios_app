//
//  LoginView.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-06.
//

import SwiftUI

struct LoginView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    var body: some View {
        VStack{
            Text("Login")
            TextField("Email", text: self.$email)
            TextField("Password", text: self.$password)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
