//
// Created by Aria Zare on 12/17/20.
//

import SwiftUI

struct TweetPage: View {

    @EnvironmentObject var networking: Networking
    @State var isWriteRhythmsPagePresented: Bool = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()

                    Text("I will put logo here")
                            .font(.system(.title))
                            .bold()
                            .padding(.bottom, -10)
                            .frame(width: 300, height: 70)
                            .aspectRatio(contentMode: .fill)
//                Image("image")
//                    .resizable()
//                    .padding(.bottom, 10)
//                    .frame(width: 140, height: 70)
//                    .aspectRatio(contentMode: .fill)

                    Spacer()
                }
                
                ScrollView {
                    ForEach(networking.feedRhythems) { item in
                        TweetCell(rhythem: item)
                    }
                }
                
            }
            
            HStack {
                Spacer()
                VStack {
                    Spacer()

                    Button(action: {
                        self.isWriteRhythmsPagePresented = true
                    }) {
                        Image(systemName: "pencil.circle.fill")
                                .resizable()
                                .foregroundColor(Color.orange)
                                .frame(width: 50, height: 50)
                                .background(Color.white)
                                .cornerRadius(25)
                    }
                        .padding()


                }
            }

        }
        .sheet(isPresented: $isWriteRhythmsPagePresented) {
            WriteTweetPage()
        }
        .onAppear {
            networking.loadFeedPage()
        }
    }
}
