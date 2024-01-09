//
//  ContentView.swift
//  SimpleSignUp
//
//  Created by Danabek Abildayev on 03.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    @State private var presentAlert = false
    
    var body: some View {
        Form {
            Section(footer: Text(userViewModel.usernameMessage).foregroundColor(.red)) {
                TextField("Username", text: $userViewModel.username)
                    .autocapitalization(.none)
            }
            
            Section(footer: Text(userViewModel.passwordMessage).foregroundColor(.red)) {
                SecureField("Password", text: $userViewModel.password)
                SecureField("Password again", text: $userViewModel.passwordAgain)
            }
            
            Section {
                Button(action: { signUp() }) {
                    Text("Sign up")
                }.disabled(!userViewModel.isValid)
            }
        }
        .sheet(isPresented: $presentAlert) {
            WelcomeView()
        }
    }
    
    func signUp() {
        presentAlert = true
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("Welcome!")
    }
}

#Preview {
    ContentView()
}
