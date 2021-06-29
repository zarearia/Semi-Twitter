//
// Created by Aria Zare on 1/17/21.
//

import SwiftUI

struct ProfilePage: View {

    @EnvironmentObject var networking: Networking

    @State var viewMode = "rhythms"
    @State var profilePhoto = UIImage(imageLiteralResourceName: "image")

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    //name
                    Text(networking.user.name)
                        .font(.system(size: 25))
                        .bold()
                    HStack {
                        //username
                        Text("@\(networking.user.username)")
                            .font(.system(size: 17))
                            .foregroundColor(.gray)

                        Spacer()
                        //TODO: A delay in load, which has to be fixed (I can reload the info as page appears)
                        MBTITypeCapsule(type: networking.user.personalityType)
                    }
                    //TODO: bio
                    Text("Some random text with length of 200")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .padding([.top, .bottom])

                }
                    .padding()

                Image(uiImage: profilePhoto)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 90, height: 90)
                    .padding()
            }
                .padding([.leading, .trailing])

            Button(action: {    }) {
                Text("Edit Profile")
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 50, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0, maxHeight: 35, alignment: .center)
            }
                .modifier(WideButtonModifier())
                .padding([.leading, .trailing], 30)

            HStack {

                Spacer()

                Button(action: {
                    viewMode = "rhythms"
                }) {
                    Text("Rhythms")
                        .foregroundColor(.orange)
                }

                Spacer()

                Button(action: {
                    viewMode = "q&a"
                }) {
                    Text("Q&A")
                        .foregroundColor(.orange)
                }

                Spacer()
            }
                .padding(.top)

            Rectangle()
                .frame(width: .infinity, height: 1)
                .foregroundColor(.orange)



            if viewMode == "rhythms" {
                List(0..<10) { item in
//                    RhythmCell(rhythem: <#Rhythem#>)
                }
                    .padding(.top, -8)
            } else {
                List(0..<10) { item in
                    QAndACell()
                }
                    .padding(.top, -8)
            }



        }
        .onAppear {
            networking.getUsersRhythems(username: self.networking.user.username)
//            networking.downloadProfileImage(username: self.networking.user.username)
            networking.user.initProfilePhoto { image in
                self.profilePhoto = image
            }
        }
    }
}
