//
//  SignInPage.swift
//  Rhythms
//
//  Created by Aria Zare on 12/20/20.
//

import SwiftUI
import Firebase

struct SignInPage: View {

    @EnvironmentObject var networking: Networking

    var body: some View {

        VStack(alignment: .center) {

            Text("Sign In")
                .bold()
                .foregroundColor(.orange)
                .font(.largeTitle)

//            Image("image")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())


            HighlightableTextField(text: $networking.user.email, placeholder: "Email", title: "Email")
                .padding([.leading, .trailing, .bottom])

            HighlightableTextField(text: $networking.user.password, placeholder: "Password", title: "Password")
                .padding([.leading, .trailing, .bottom])

            Text(networking.authErrorMessage)
                .foregroundColor(.red)
                .font(.footnote)
                .lineLimit(3)

            Spacer()

            Spacer()

            Button(action: {
                networking.signIn()
            }, label: {
                HStack {
                    Text("Sign in")
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

//    var body: some View {
//        AuthParentPage(title: "Sign In") {
//            Auth.auth().signIn(withEmail: networking.email, password: networking.password) { (authDataResult, error) in
//                guard error == nil else {
//                    print(error?.localizedDescription)
//                    networking.authErrorMessage = error?.localizedDescription ?? "unknown problem"
//                    return
//                }
//                print(authDataResult?.additionalUserInfo)
//                print("User is signed in")
//                networking.isUserSignedIn()
//            }
//        }/*.environmentObject(networking)*/
//    }
}

//struct SignInPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInPage()
//    }
//}
