//
// Created by Aria Zare on 1/17/21.
//

import SwiftUI

struct MatchingCell: View {

    var body: some View {
        HStack {
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Name")
                    .bold()
                    .foregroundColor(.orange)
                    .font(.system(size: 18))
                HStack {
                    Text("@username")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                    MBTITypeCapsule(type: .INFJ)

                }
            }
        }
    }
}
