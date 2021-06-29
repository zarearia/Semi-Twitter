//
// Created by Aria Zare on 12/17/20.
//

import SwiftUI

struct TweetCell: View {
    
    @EnvironmentObject var networking: Networking
    let rhythem: Tweet

    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: networking.profileImages[rhythem.owner] ?? UIImage(imageLiteralResourceName: "image"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 55, height: 55)
                    .padding(.top, 5)
            VStack(alignment: .leading) {
                Text(rhythem.owner)
                        .bold()
                        .foregroundColor(.orange)
                        .font(.system(size: 18))
                Text("@\(rhythem.owner)")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))

                Text(rhythem.text)
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    .padding(.top, 5)
            }
                .padding(10)
            
            Spacer()
        }
    }
}

struct QAndACell: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 55, height: 55)
                    .padding(.top, 5)
            VStack(alignment: .leading) {
                Text("Name")
                        .bold()
                        .foregroundColor(.orange)
                        .font(.system(size: 18))
                Text("@username")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))

                Text("This is A Question: ")
                    .bold()
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    .padding(.top, 5)

                Text("This is the answer")
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    .padding(.top, 5)
            }
                    .padding(10)
        }
    }
}

//struct ChatUserCell: View {
//    var body: some View {
//        HStack(alignment: .top) {
//            Image("image")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .clipShape(Circle())
//                    .frame(width: 55, height: 55)
//                    .padding(.top, 5)
//            VStack(alignment: .leading) {
//
//                HStack {
//                    Text("Name")
//                            .bold()
//                            .foregroundColor(.orange)
//                            .font(.system(size: 16))
//                    Text("@username")
//                            .foregroundColor(.gray)
//                            .font(.system(size: 15))
//                }
//                    .padding(.top, 10)
//
//                Text("Hello From Rhythms")
//                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
//                    .padding(.top, 1)
//            }
//        }
//    }
//}
