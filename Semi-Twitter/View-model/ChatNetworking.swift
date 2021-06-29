//
//  ChatNetworking.swift
//  Rhythms
//
//  Created by Aria Zare on 5/31/21.
//

import Firebase
import FirebaseFirestoreSwift


class ChatNetworking: ObservableObject {
    
    let networking = Networking.networking
    @Published var chatMessageUsers = [ChatUserType]()
    @Published var chatMessages = [ChatMessageType]()
    @Published var chatUsers = [String]()
    @Published var charIds = [String]()
//    @Published var profileImages = [String: UIImage]()
    
    func loadChatUsersPage() {
        
        networking.db.collection("chats").whereField("users", arrayContains: networking.user.username).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("failed to load users messages page with error: \(error)")
                return
            }
            
            self.chatMessageUsers = documents.compactMap({ (data) -> ChatUserType? in
                return try? data.data(as: ChatUserType.self)
            })
            
            var allUsersIds = [String]()
            
            for item in self.chatMessageUsers {
                allUsersIds.append(contentsOf: item.users)
            }
            
            self.getAllProfilePhotosForThisChat(usernames: allUsersIds)
            
        }
        
    }
    
    func startLoadingChats(chatId: String) {
        loadMessages(chatId: chatId)
        loadProfilePhotos(chatId: chatId)
    }
    
    func sendMessage(chatId: String, message: String) {
        
//        TODO: send using ChatMessageType
//        let messageDoc: [String : Any] = ["message": message, "timeSent": FieldValue.serverTimestamp(), "sender": networking.user.username]
        let messageDoc = ChatMessageType(message: message, sender: networking.user.username)
        
        do {
            let _ = try networking.db.collection("chats/\(chatId)/messages").addDocument(from: messageDoc) { error in
                if let error = error {
                    print("failed to send message with title: \n\(message), \nwith error: \(error)")
                } else {
    //                print("message successfully sent, title: \n\(message) ")
                    
                    self.networking.db.document("chats/\(chatId)").updateData(["lastMessageTime": FieldValue.serverTimestamp()])
                    self.networking.db.document("chats/\(chatId)").updateData(["lastMessageTitle": message])
                    
                }
            }
        } catch {
            print("failed to send message with codeable, message: \(message), error: \(error)")
        }
        
    }
    
    
    private func loadMessages(chatId: String) {
        //TODO: Do I need to detach the listiner
        networking.db.collection("chats/\(chatId)/messages").order(by: "timeSent").addSnapshotListener { querySnapshot, error in
            
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            
            self.chatMessages = documents.compactMap { (data) -> ChatMessageType? in
                return try? data.data(as: ChatMessageType.self)
            }

        }
        
    }
    
    private func loadProfilePhotos(chatId: String) {
        
        networking.db.document("chats/\(chatId)").getDocument { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching documents: \(error!)")
                return
            }
            if let chatUsers = document.data()?["users"] as? [String] {
                self.chatUsers = chatUsers
                self.getAllProfilePhotosForThisChat(usernames: chatUsers)
            }
        }
    }
    
    private func getAllProfilePhotosForThisChat(usernames: [String]) {
        var usernames = usernames
//        usernames.removeAll { $0 == self.networking.user.username }
        usernames.removeAll { item in
            self.networking.profileImages.contains { (key, value) in
                key == item
            }
        }
//        print("loading images for users: \n\(usernames)")
        for username in usernames {
            networking.downloadProfileImage(username: username) { image in
                self.networking.profileImages[username] = image
//                print("**************************************\nimages recieved\n********************************")
//                print(self.networking.profileImages)
            }
        }
    }
    
}
