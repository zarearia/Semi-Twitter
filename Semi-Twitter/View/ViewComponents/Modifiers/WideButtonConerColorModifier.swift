//
// Created by Aria Zare on 1/5/21.
//

import SwiftUI

struct WideButtonConerColorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .overlay(Capsule().stroke(Color.orange, lineWidth: 2))
    }
}
