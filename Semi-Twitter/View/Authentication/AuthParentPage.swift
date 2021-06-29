//
//  AuthParentPage.swift
//  Rhythms
//
//  Created by Aria Zare on 12/20/20.
//

import SwiftUI

struct AuthParentPage: View {

    @EnvironmentObject var networking: Networking
    
    //title is also used as button text
    var title: String
    
    var buttonAction: () -> Void
    
    init(title: String, buttonAction: @escaping () -> Void) {
        self.title = title
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Text(title)
                .bold()
                .foregroundColor(.orange)
                .font(.largeTitle)
            
//            Image("image")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())


            HighlightableTextField(text: $networking.user.email, placeholder: "Name")
                .padding([.leading, .trailing, .bottom])

            HighlightableTextField(text: $networking.user.email, placeholder: "Password")
                .padding([.leading, .trailing, .bottom])
            
            Text(networking.authErrorMessage)
                .foregroundColor(.red)
                .font(.footnote)
                .lineLimit(3)

            Spacer()

            Spacer()
            
                Button(action: buttonAction, label: {
                    HStack {
                        Text(title)
                            .foregroundColor(.white)
                    }
                    .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0, maxHeight: 50, alignment: .center)
                })
                    .modifier(WideButtonModifier())
                    .padding()
            
            Spacer()
            
        }
        .padding([.bottom, .leading, .trailing])
        .padding(.top, -30)
    }
}

//struct AuthParentPage_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthParentPage(title: "Sign up") {
//
//        }
//    }
//}
