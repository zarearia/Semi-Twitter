//
// Created by Aria Zare on 1/4/21.
//

import SwiftUI

struct HighlightableTextField: View {

    @Binding var text: String
    var placeholder = ""
    @State var isOnEdit = false
    var title = ""

    var body: some View {
        VStack(alignment: .leading) {

            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.gray)

            TextField(placeholder, text: $text, onEditingChanged: { changed in
                if changed {
                    //is on edit
                    isOnEdit = true
                } else {
                    // is off edit when an other text field is selected
                    isOnEdit = false
                }
                print("on edit: \(changed)")
            }) {
                print("off edit")
                isOnEdit = false
            }
                .foregroundColor(.gray)

            Rectangle()
                .foregroundColor(isOnEdit ? .orange : .gray)
                .frame(height: 2)
        }
    }
}
