//
// Created by Aria Zare on 1/22/21.
//

import SwiftUI
import Firebase

struct WriteTweetPage: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networking: Networking

    @State var text = ""

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancell")
                        .foregroundColor(.orange)
                }

                Spacer()

                Button(action: postAction) {
                    HStack {
                        Text("Post")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .padding([.top, .bottom], 3)
                            .padding([.leading, .trailing], 20)
                    }
                        .background(Color.orange)
                        .cornerRadius(15)
                }

            }

            HStack {
                Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 35, height: 35)
                        .padding(5)

                TextField("Write your Rhythm", text: $text)
                    .accentColor(.orange)

            }

            Spacer()

        }
            .padding()
    }

    func postAction() {
        //TODO: Fix date in term of necessity
        let rhythem = Tweet(owner: self.networking.user.username, text: self.text)
        networking.postRhythem(rhythem: rhythem)
        self.text = ""
        presentationMode.wrappedValue.dismiss()
    }
}
