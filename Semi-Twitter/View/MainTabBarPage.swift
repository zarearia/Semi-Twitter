//
//  ContentView.swift
//  Rhythms
//
//  Created by Aria Zare on 12/17/20.
//
//

import SwiftUI

struct MainTabBarPage: View {
    
    @EnvironmentObject var networking: Networking
    
    var body: some View {
        TabView {

            TweetPage()
                .tabItem {
                    Image(systemName: "house.fill")
                }.tag(0)

            MatchingPage()
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                }.tag(1)

            SearchPage()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(2)

            MainChatPage()
                .tabItem {
                    Image(systemName: "message.fill")
                }.tag(3)

            ProfilePage()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }.tag(4)


        }.sheet(isPresented: $networking.isAuthFirstPagePresented, content: {
            AuthFirstPage()
                .environmentObject(networking)
        })
        .onAppear {
            networking.isUserSignedIn()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
