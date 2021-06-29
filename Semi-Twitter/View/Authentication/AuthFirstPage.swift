//
//  AuthFirstPage.swift
//  Rhythms
//
//  Created by Aria Zare on 12/20/20.
//

import SwiftUI

struct AuthFirstPage: View {
    
    @EnvironmentObject var networking: Networking
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
//                Button(action: buttonAction, label: {
//                    HStack {
//                        Text(title)
//                            .foregroundColor(.white)
//                    }
//                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .greatestFiniteMagnitude, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 0, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                })
//                    .background(Color.orange)
//                    .cornerRadius(5)
//                    .padding()
                
                NavigationLink(
                    destination: SignUpPage().environmentObject(networking),
                    label: {
                        HStack {
                            Text("Sign up")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .greatestFiniteMagnitude, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 0, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    })
                    .modifier(WideButtonModifier())
//                    .background(Color.orange)
//                    .cornerRadius(5)
                    .padding()
                
                
                NavigationLink(
                    destination: SignInPage(),
                    label: {
                        HStack {
                            Text("Sign In")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .greatestFiniteMagnitude, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 0, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    })
                    .modifier(WideButtonModifier())
//                    .background(Color.orange)
//                    .cornerRadius(5)
                    .padding()
                
                Spacer()
            }
        }
    }
}

//struct AuthFirstPage_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthFirstPage()
//    }
//}
