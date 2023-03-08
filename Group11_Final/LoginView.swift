//
//  LoginView.swift
//  Group11_Final
//
//  Created by Om Chevli on 2023-03-06.
//

import SwiftUI

struct LoginView: View {
    let const = Constants()
    let defaults = UserDefaults.standard
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var isLoggedIn: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                //Text("Login")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding()
                
                TextField("Email", text: $email)
                    .padding()
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Toggle("Remember Me", isOn: $rememberMe)
                    .padding()
                
                Button(action: {
                    // Validate form fields
                    if email.isEmpty || password.isEmpty {
                        // Show error message
                    } else {
                        // Perform login action
                        if rememberMe {
                            saveCredentials()
                        }
                        //login user and navigate to next screen
                        logInUser()
                    }
                }, label: {
                    Text("Login")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                Spacer()
            }//Vstack
            .padding()
            .navigationTitle("Login")
        }//NavigationView
        
        .onAppear(perform: {
            self.loadInitialData()
        })
        .fullScreenCover(isPresented: $isLoggedIn){
            ActivitiesView(activities: [])
        }
        
    }
    
    func saveCredentials() {
        
        defaults.set(self.email, forKey: const.EMAIL_KEY)
        defaults.set(self.password, forKey: const.PASSWORD_KEY)
    }
    
    func logInUser() {
        self.isLoggedIn = true
        defaults.set(true, forKey: const.IS_LOGGED_IN_KEY)
    }
    
    
    func loadInitialData(){
        let savedEmail:String = defaults.string(forKey: const.EMAIL_KEY) ?? ""
        let savedPassword:String = defaults.string(forKey: const.PASSWORD_KEY) ?? ""
        if(!savedEmail.isEmpty && !savedPassword.isEmpty){
            self.email = savedEmail
            self.password = savedPassword
        }
    }

}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
