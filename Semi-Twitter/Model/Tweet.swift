//
// Created by Aria Zare on 3/25/21.
//

import FirebaseFirestoreSwift
import Firebase


struct Tweet: Codable, Identifiable {
    @DocumentID var id = UUID().uuidString
//    var owner: User = User(email: "", name: "", password: "", username: "", dateOfBirth: .init(), personalityType: .XXXX)
    var owner: String
    var text: String
    //TODO: Fix date in term of necessity
    @ServerTimestamp var dateCreated: Timestamp?

//    var dictionary: [String: Any] {
//        [
//            "ownerId": ownerId,
//            "title": text,
//            "dateCreated": dateCreated
//        ]
//    }
//
//    init(owner: User, ownerId: String, text: String, dateCreated: Date) {
//        self.owner = owner
//        self.ownerId = ownerId
//        self.text = text
//        self.dateCreated = dateCreated
//    }
//
//    //TODO: Complete dictionary initializer
//    convenience init?(dictionry: [String: Any]) {
//
//        guard let ownerId = dictionry["ownerId"] as? String,
//           let text = dictionry["text"] as? String else {
//
//            return nil
//        }
//
//        let owner = User(email: "", name: "", password: "", username: "", dateOfBirth: .init(), personalityType: .XXXX)
//
////        Fixme: Fix this dateCreated with  a convertor  to convert firebase timestamp to date and viseversa
//        self.init(owner: owner, ownerId: ownerId, text: text, dateCreated: .distantPast)
//
//        Networking.networking.db.collection("users").document(ownerId).getDocument { (document, error) in
//            if let document = document, document.exists {
//                print(document.data())
//                if let user = User.init(dictionary: document.data()!) {
//                    self.owner = user
//                }
//            } else {
//                print("user doesnt exist")
//            }
//        }
//    }
//
//    private func initfromcloud() {
//
//    }
}
