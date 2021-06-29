//
// Created by Aria Zare on 1/17/21.
//

import SwiftUI

struct MainChatPage: View {
    
    @EnvironmentObject var networking: Networking
    @StateObject var chatNetworking: ChatNetworking = ChatNetworking()
    @State var isChatPagePresented = false
    @State var chatId = ""
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                SearchBar(searchAction: {
                    print("implement search")
                }, btext: $searchText)
                    .padding([.leading, .trailing])
                
                NavigationLink(
                    destination: ChatPage(chatNetworking: chatNetworking, chatId: chatId),
                    isActive: $isChatPagePresented,
                    label: {
                        EmptyView()
                    })

//                List {
                ScrollView{
                    ForEach(chatNetworking.chatMessageUsers) { item in
                        ChatUserCell(chatNetworking: chatNetworking, chatSectionName: item.chatSectionName, lastMessage: item.lastMessageTitle)
                            .environmentObject(networking)
                            .onTapGesture {
                                //TODO: fix Here?
                                chatId = item.id ?? ""
                                isChatPagePresented = true
                            }
                    }
                }
//                }
            }
                .navigationBarTitle("Chats")
                .navigationBarHidden(true)
        }.onAppear {
            chatNetworking.loadChatUsersPage()
        }
    }
}


//struct ChatPage: View (
//    var body: some View {
//
//    }
//)
