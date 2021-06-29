//
//  Networking.swift
//  Rhythms
//
//  Created by Aria Zare on 12/20/20.
//

import SwiftUI
import Firebase

class Networking: ObservableObject {
    
    static let networking = Networking()

    let db = Firestore.firestore()
    let storage = Storage.storage()
    let locationManager = LocationManager.locationManager
    
    @Published var user = User(email: "", name: "", password: "", username: "", dateOfBirth: .init(), personalityType: .XXXX)
    
    @Published var feedRhythems = [Tweet]()
    
    @Published var isAuthFirstPagePresented = false
    
    @Published var authErrorMessage = ""
    
    @Published var profileImages = [String: UIImage]()
//    @Published var isVerificationCheckPagePresented = false
    
    func reinitialzeUser(username: String) {
        db.collection("users").document(username).getDocument { (document, error) in
            if let document = document, document.exists {
                print(document.data())
                self.user = User(dictionary: document.data()!)!
            } else {
                print("init username doesnt exist")
            }
        }
    }

    func postRhythem(rhythem: Tweet) {
        do {
            let _ = try db.collection("posts").addDocument(from: rhythem) { error in
                if let error = error {
                    print("Error writing post: \(error)")
                } else {
                    print("post successfully written!")
                }
            }
        } catch {
            print("Error writing post (do catch): \(error)")
        }
    }

    func loadFeedPage() {
        db.collection("posts").whereField("owner", in: ["ariazare", "Ariazare2"]).order(by: "dateCreated", descending: true).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error loading feed: \(error)")
                return
            }
            print("feed loaded")
            self.feedRhythems = documents.compactMap({ (data) -> Tweet? in
                return try? data.data(as: Tweet.self)
            })
            print(self.feedRhythems)
            
        }
    }
    
    func searchUser(string: String) {
        db.collection("users").whereField("username", isEqualTo: string).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error loading user search: \(error)")
                return
            }
            print("user search done")
            print(documents)
        }
    }
    
    func getUsersRhythems(username: String) {
        print(username)
//        db.collection("users").document(username).getDocument { (document, error) in
//            if let document = document, document.exists {
//                print("@\(username)'s posts:")
//                print(document.data()!["posts"].map(<#T##transform: (Any) throws -> U##(Any) throws -> U#>))
//                let dataDescription = document.data()!["posts"].map({
//                    print(<#T##items: Any...##Any#>)
//                }) ?? "nil"
//                    print("Cached document data: \(dataDescription)")
//            } else {
//                print("User doesn't exist (document doesnt exist)")
//            }
//        }
    }

}
