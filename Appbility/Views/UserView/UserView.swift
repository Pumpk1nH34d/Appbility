//
//  UserView.swift
//  Appbility
//
//  Created by Au?tin on 14/11/2023.
//

import SwiftUI
import FirebaseAuth

struct UserView: View {
    @State private var text: String = "Welcome!!"

    
    var body: some View {
        ProfileCardView()
        
        
    }
}


#Preview {
    UserView()
}
