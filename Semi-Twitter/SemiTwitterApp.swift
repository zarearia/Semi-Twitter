//
//  RhythmsApp.swift
//  Rhythms
//
//  Created by Aria Zare on 12/17/20.
//
//

import SwiftUI
import Firebase

let defaults = UserDefaults.standard
let emailKey = "email"
let passwordKey = "password"
let nameKey = "name"
let usernameKey = "username"
let dateOfBirthKey = "dateOfBirth"
let personalityTypeKey = "personalityType"

@main
struct SemiTwitterApp: App {
    
    init() {
        FirebaseApp.configure()
        
        if let username = defaults.string(forKey: usernameKey) {
            Networking.networking.reinitialzeUser(username: username)

        }
        
        //TODO: Delete this
//        try! Auth.auth().signOut()
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabBarPage().environmentObject(Networking.networking)
                .onAppear{
                    print(Auth.auth().currentUser)
//                    Networking.networking.sendATestMessage()
                    //NOTE: this cacnt be done in an app without UI so I have to put it here
                    LocationManager.locationManager.manager.pausesLocationUpdatesAutomatically = true
                }
        }
    }
}
