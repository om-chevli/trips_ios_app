//
//  LoginManager.swift
//  Group11_Final
//
//  Created by Karan Meghani on 2023-03-08.
//

import Foundation

class AuthManager{
    static let shared = AuthManager()
    private let validUsers:[User]
    private let defaults = UserDefaults.standard
    private let const = Constants()
    private var currentUserId:String?
    
    func loginUser(email:String, password:String) -> Bool{
        let loggedInUser:User? = validUsers.first{$0.email == email && $0.password == password}
        
        if(loggedInUser != nil){
            defaults.set(email, forKey: const.EMAIL_KEY)
            defaults.set(password, forKey: const.PASSWORD_KEY)
            defaults.set(loggedInUser!.id, forKey: const.LOGGED_IN_USER_ID)
            defaults.set(true, forKey: const.IS_LOGGED_IN_KEY)
            currentUserId = loggedInUser!.id
            return true
        }
        return false
    }
    
    func getCurrentUserId() -> String?{
        return currentUserId
    }
    
    func setCurrentUserId(){
        let userId:String = defaults.string(forKey: const.LOGGED_IN_USER_ID) ?? ""
        currentUserId = userId
    }
    func logoutUser() {
        defaults.set("", forKey: const.LOGGED_IN_USER_ID)
        defaults.set(false, forKey: const.IS_LOGGED_IN_KEY)
    }
    
    private init(){
        self.validUsers = [
            User(id: "U1", email: "johndoe@gmail.com", password: "User@123"),
            User(id: "U2", email: "stevemadden@hotmail.com", password: "User@123")
        ]
    }
    
}
