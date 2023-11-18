//
//  SplashLoaderView.swift
//  Appbility
//
//  Created by Au?tin on 13/11/2023.
//

import SwiftUI
import FirebaseAuth


struct LoginView: View {
    @State private var currentView = 0
    
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack{
            switch currentView{
            case 0:
                _LoginView(currentView: $currentView)
            case 1:
                SignUpView()
            default:
                UserView()
            }
        }.transition(.opacity)
    }
}

private struct _LoginView: View {
    @Binding var currentView: Int
    

    
    @State private var email = ""
    @State private var password = ""
    
    @State private var scale = CGSize(width: 10.0, height: 10.0)
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack{
            circleBackgroundView()
            VStack {
                Text("Login")
                    .font(Font.custom("Nunito", size: 40))
                    .bold()
                    .foregroundColor(Color("Light Blue"))
                    .padding()
                
                VStack{
                    InputView(text: $email, placeholder: "example@email.com", image: "at", isSecureField: false)
                    InputView(text: $password, placeholder: "Password", image: "lock", isSecureField: true)
                }
                
                Button {
                    authenticateUser(email: email, password: password) { authResult in
                        DispatchQueue.main.async {
                            if authResult{
                                withAnimation{
                                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                                    currentView = 2
                                }
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
                .background(Color("Light Blue"))
                .cornerRadius(10)
                .padding()
                
                Button{
                    withAnimation{
                        currentView = 1
                    }
                }label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(Font.custom("Nunito", size: 14))
                    .foregroundColor(Color("Light Blue"))
                }
            }
        }
    }
}



#Preview {
    LoginView()
}

