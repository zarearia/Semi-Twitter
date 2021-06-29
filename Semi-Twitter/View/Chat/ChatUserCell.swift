//
//  ChatUserCell.swift
//  Rhythms
//
//  Created by Aria Zare on 6/17/21.
//

import SwiftUI

struct ChatUserCell: View {
    
    @EnvironmentObject var networking: Networking
    @ObservedObject var chatNetworking: ChatNetworking
    @State var chatSectionName: String = ""
    @State var lastMessage: String = ""
    
    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: networking.profileImages[chatSectionName] ?? #imageLiteral(resourceName: "image-2"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 55, height: 55)
                    .padding(.top, 5)
            VStack(alignment: .leading) {

                HStack {
                    Text(chatSectionName)
                            .bold()
                            .foregroundColor(.orange)
                            .font(.system(size: 16))
//                    Text("@username")
//                            .foregroundColor(.gray)
//                            .font(.system(size: 15))
                }
                    .padding(.top, 10)

                Text(lastMessage)
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    .padding(.top, 1)
            }
            Spacer()
        }
    }
}
