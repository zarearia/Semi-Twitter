//
// Created by Aria Zare on 1/17/21.
//

import SwiftUI

struct SearchPage: View {
    
    @EnvironmentObject var networking: Networking
    @State var searchText = ""
    
    var body: some View {
        VStack {
//            HStack {
//                Spacer()
//
//                Text("Search")
//                        .font(.system(.title))
//                        .bold()
//                        .padding(.bottom, 10)
//                        .frame(width: 140, height: 70)
//                        .aspectRatio(contentMode: .fill)
//
//                Spacer()
//            }

            SearchBar(searchAction: {
                networking.searchUser(string: searchText)
            }, btext: $searchText)
                .padding([.leading, .trailing])
            
            
            List(0..<3) { item in
                MatchingCell()
            }
        }
    }
}
