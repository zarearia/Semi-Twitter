//
//  ChatUserType.swift
//  Rhythms
//
//  Created by Aria Zare on 6/17/21.
//

import Firebase
import FirebaseFirestoreSwift

struct ChatUserType: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var chatSectionName: String
    var lastMessageTime: Date
    var lastMessageTitle: String
    var users: [String]
}
