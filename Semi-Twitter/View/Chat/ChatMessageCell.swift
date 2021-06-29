//
//  ChatMessage.swift
//  Rhythms
//
//  Created by Aria Zare on 6/10/21.
//

import SwiftUI

struct ChatMessageCell: View {
    
    @EnvironmentObject var networking: Networking
    @ObservedObject var chatNetworking: ChatNetworking
    @State var sender: String
    @State var text: String
    @State var isSenderSelf: Bool
    let cornerRadius: CGFloat = 10
    
    var body: some View {
        VStack(alignment: isSenderSelf ? .trailing : .leading) {
            HStack(alignment: .bottom) {
                
                if isSenderSelf {
                    
                    Spacer()
                    
                    Text(text)
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(10)
                        .background(Color.gray)
                        .cornerRadius(cornerRadius, corners: .topLeft)
                        .cornerRadius(cornerRadius, corners: .topRight)
                        .cornerRadius(cornerRadius, corners: .bottomLeft)
                        .padding(.leading, 50)
                        .padding(.trailing, 10)
                    
                } else {
                    //TODO Change this image literal later
                    Image(uiImage: networking.profileImages[sender] ?? #imageLiteral(resourceName: "image-2"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                        .padding([.leading], 5)
                    
                    Text(text)
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(cornerRadius, corners: .topLeft)
                        .cornerRadius(cornerRadius, corners: .topRight)
                        .cornerRadius(cornerRadius, corners: .bottomRight)
                        .padding([.trailing], 5)
                    
                    Spacer()
                }
            }
            
            Text("19:29 2020/5/1")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding([.leading, .trailing], isSenderSelf ? 20 : 55)
                .padding(.bottom, 10)
            
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
