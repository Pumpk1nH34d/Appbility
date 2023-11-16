//
//  FirebaseAuth.swift
//  Appbility
//
//  Created by Au?tin on 13/11/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

func authenticateUser(email: String, password: String, completion: @escaping (AuthDataResult?) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
            print(error.localizedDescription)
            completion(nil)
        } else {
            completion(result)
        }
    }
}

func createUser(email: String, password: String, firstname: String, surname: String, completion: @escaping (Bool) -> Void) {
    let db = Firestore.firestore()
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        if error == nil {
            
            authenticateUser(email: email, password: password) { authResult in
                if let result = authResult {
                    print("User is authenticated, user ID: \(result.user.uid)")
                    db.collection("users").document(Auth.auth().currentUser!.uid).setData([
                        "firstname": firstname,
                        "lastname": surname,
                        "email": email
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                            completion(false)
                        } else {
                            print("Document successfully written!")
                            completion(true)
                        }
                    }
                }else {
                    completion(false)
                }
            }
        }else {
            completion(false)
        }
    }
}
    
func getUserEmail() -> String {
    return Auth.auth().currentUser?.email ?? "No email found"
}
 
