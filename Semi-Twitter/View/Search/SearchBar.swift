//
// Created by Aria Zare on 1/21/21.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    let searchAction: () -> Void
    @Binding var btext: String

    class Coordinator: NSObject, UISearchBarDelegate {
        let parent: SearchBar
        var text = ""

        init(_ parent: SearchBar) {
            self.parent = parent
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            self.parent.btext = text
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            parent.searchAction()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.tintColor = .orange
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {

    }
}
