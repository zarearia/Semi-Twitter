//
// Created by Aria Zare on 1/5/21.
//

import SwiftUI

struct WideButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.orange)
            .cornerRadius(20)
    }
}

