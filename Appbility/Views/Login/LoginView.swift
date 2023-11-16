//
//  SplashLoaderView.swift
//  Appbility
//
//  Created by Au?tin on 13/11/2023.
//

import SwiftUI
import FirebaseAuth


struct LoginView: View {
    @State private var currentView = false
    
    var body: some View {
        if currentView{
            SignUpView()
        } else{
            _LoginView(currentView: $currentView)
        }
    }
}

private struct _LoginView: View {
    @Binding var currentView: Bool
    
    @State private var email = ""
    @State private var password = ""

    @State private var scale = CGSize(width: 10.0, height: 10.0)
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack {
            Color("Dark Blue")
                .ignoresSafeArea(.all)
            ZStack{
                circleBackgroundView()
                
                VStack {
                    Text("Login")
                        .font(Font.custom("Nunito", size: 40))
                        .bold()
                        .foregroundColor(Color("Dark Blue"))
                        .padding()
                    
                    VStack{
                        InputView(text: $email, placeholder: "example@email.com", image: "at", isSecureField: false)
                        InputView(text: $password, placeholder: "Password", image: "lock", isSecureField: true)
                    }
                    
                    Button {
                        authenticateUser(email: email, password: password) { authResult in
                            DispatchQueue.main.async {
                                if let result = authResult {
                                    currentView = true
                                    print("User is authenticated, user ID: \(result.user.uid)")
                                }
                            }
                        }
                    } label: {
                        Text("Login")
                            .font(Font.custom("Nunito", size: 20))
                            .bold()
                        Image(systemName: "arrow.right")
                            .bold()
                    }
                    
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("Dark Blue"))
                    .cornerRadius(10)
                    .padding()
                    
                    Button{
                        DispatchQueue.main.async {
                            currentView = true
                            print("switched")
                        }
                    }label: {
                        HStack{
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.bold)
                        }
                        .font(Font.custom("Nunito", size: 14))
                        .foregroundColor(Color("Dark Blue"))
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


