//
//  Group11_FinalApp.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-06.
//

import SwiftUI

@main
struct Group11_FinalApp: App {
    
    init() {
        AuthManager.shared.setCurrentUserId()
    }
    
    var body: some Scene {
        let defaults = UserDefaults.standard
        let const = Constants()
        let isLoggedIn = defaults.bool(forKey: const.IS_LOGGED_IN_KEY)
        WindowGroup {
            //ContentView()
            if isLoggedIn{
                ContentView()
            }else{
                LoginView()
            }
            
        }
    }
}
