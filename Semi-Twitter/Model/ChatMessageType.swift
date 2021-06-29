//
//  ChatMessages.swift
//  Rhythms
//
//  Created by Aria Zare on 6/13/21.
//

import Firebase
import FirebaseFirestoreSwift

struct ChatMessageType: Codable, Identifiable {
    
    @DocumentID var id: String? = UUID().uuidString
    var message: String
    @ServerTimestamp var timeSent: Timestamp?
    var sender: String

}
