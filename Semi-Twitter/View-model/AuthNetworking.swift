//
//  AuthNetworking.swift
//  Rhythms
//
//  Created by Aria Zare on 12/20/20.
//

import SwiftUI
import Firebase

extension Networking {
    
    func isUserSignedIn() {
                
        if let user = Auth.auth().currentUser {
            isAuthFirstPagePresented = false
        } else {
            isAuthFirstPagePresented = true
        }
    }

    func signIn() {
        Auth.auth().signIn(withEmail: self.user.email, password: self.user.password) { (authDataResult, error) in
            guard error == nil else {
                print(error?.localizedDescription)
                self.authErrorMessage = error?.localizedDescription ?? "unknown problem"
                return
            }
            print(authDataResult?.additionalUserInfo)
            print("User is signed in")
            self.isUserSignedIn()
        }
    }
    
    func signUp() {

//        //TODO And NOTE: Use transactions to check the username doesnt exist in FireStore

        let userRef = db.collection("users").document("\(user.username)")
        
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.authErrorMessage = "this username already exists"
            } else {
                Auth.auth().createUser(withEmail: self.user.email, password: self.user.password) { authResult, error in

                    guard error == nil else {
                        print(error?.localizedDescription)
                        self.authErrorMessage = error?.localizedDescription ?? "unknown problem"
                        return
                    }

//                    let usersDoc = self.db.collection("users")
//                    usersDoc.setValue(self.user.dictionary, forKey: self.user.username)

                    userRef.setData(self.user.dictionary)
                    
                    print("User added to database")

                    self.sendVerificationCode()
                }
            }
        }

    }
    
    func sendVerificationCode() {
        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in

            guard error == nil else {
                print(error?.localizedDescription)
                self.authErrorMessage = error?.localizedDescription ?? "unknown problem sending email"
                return
            }

            print("Email Verification sent")

        })
    }
    
    func setUserLocation() {
        let userRefrence = db.collection("users").document(self.user.username).updateData(locationManager.dictionary, completion: nil)
//        userRefrence.updateData(locationManager.dictionary) { error in
//            if error != nil {
//                fatalError("Some error occured")
//            }
//        }
    }

    func updateUserInCloud() {
        db.collection("users").document(self.user.username).updateData(user.dictionary, completion: nil)
    }
}
