//
//  ChatPage.swift
//  Rhythms
//
//  Created by Aria Zare on 6/10/21.
//

import SwiftUI

struct ChatPage: View {
    
//    @EnvironmentObject var networking: Networking
    //TODO: Change this to Observable and move stateobject to topper level view
//    @StateObject var chatNetworking: ChatNetworking = ChatNetworking()
    @ObservedObject var chatNetworking: ChatNetworking
    @State var chatId: String
    @State var testMessageText: String = ""
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                ScrollViewReader { scrollValue in
                
                    ForEach(chatNetworking.chatMessages, id: \.id) { item in
                        ChatMessageCell(chatNetworking: chatNetworking, sender: item.sender, text: item.message, isSenderSelf: item.sender == chatNetworking.networking.user.username ? true : false)
                    }.onReceive(chatNetworking.$chatMessages, perform: { _ in
                        //TODO: find an alternative to this timing
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            scrollValue.scrollTo(chatNetworking.chatMessages.last?.id)
                        }
                    })
                    .onAppear {
                        scrollValue.scrollTo(chatNetworking.chatMessages.last?.id)
                    }
                }
                
                Spacer()
                
            }
            
            //TODO: redesign this part
            
            HStack {
                TextField("StartTyping", text: $testMessageText)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                
                Button {
                    chatNetworking.sendMessage(chatId: chatId, message: testMessageText)
                    testMessageText = ""
                } label: {
                    Text("send")
                }

            }
            
        }.onAppear {
            self.chatNetworking.startLoadingChats(chatId: chatId)
        }
        

    }
}
