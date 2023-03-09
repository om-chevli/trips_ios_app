//
//  User.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-06.
//

import Foundation
class User:Identifiable {
    var id:String
    var email: String
    var password: String
    
    init(id:String, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
}
