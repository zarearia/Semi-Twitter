//
// Created by Aria Zare on 1/17/21.
//

import SwiftUI

struct MBTITypeCapsule: View {

    @State var type: MBTIType!

    var backgroundColor: Color {
        if type.rawValue.contains("NF") {
            return Color.green
        } else if type.rawValue.contains("NT") {
            return Color.red
        } else if type.rawValue.contains("S") && type.rawValue.contains("J") {
            return Color.blue
        } else if type.rawValue.contains("S") && type.rawValue.contains("P") {
            return Color.orange
        } else {
            return Color.gray
        }
    }

    var body: some View {
        HStack {
            Text(String(type.rawValue))
                .foregroundColor(.white)
                .font(.system(size: 12))
                .padding([.top, .bottom], 3)
                .padding([.leading, .trailing], 20)
        }
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
