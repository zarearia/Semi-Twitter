//
// Created by Aria Zare on 1/17/21.
//

import SwiftUI

struct MatchingPage: View {
    
    var isMBTISettedUp = true
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()

                Text("Matching")
                        .font(.system(.title))
                        .bold()
                        .padding(.bottom, 10)
                        .frame(width: 140, height: 70)
                        .aspectRatio(contentMode: .fill)

                Spacer()
            }
            
            if isMBTISettedUp{
                List(0..<3) { item in
                    MatchingCell()
                }
            }
            else {
                
                Spacer()
                
                Button(action: {
                }, label: {
                    HStack {
                        Text("Setup MBTI")
                            .foregroundColor(.white)
                    }
                        .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0, maxHeight: 50, alignment: .center)
                })
                    .modifier(WideButtonModifier())
                    .padding()
                
                Spacer()
                
            }

        }
    }
}
