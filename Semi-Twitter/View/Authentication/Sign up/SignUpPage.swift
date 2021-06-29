//
//  AuthPage.swift
//  Rhythms
//
//  Created by Aria Zare on 12/18/20.
//

import SwiftUI
import Firebase

struct SignUpPage: View {

    @EnvironmentObject var networking: Networking

    @State var isVerificationCheckPagePresented = false
    
    var body: some View {

        VStack(alignment: .center) {

            NavigationLink(
                destination: VerificationCheckPage(),
                isActive: $isVerificationCheckPagePresented,
                label: {
                    EmptyView()
            })
            
            Text("Join Our Crib")
                .bold()
                .foregroundColor(.orange)
                .font(.largeTitle)
                .padding([.bottom, .trailing, .leading])


            HighlightableTextField(text: $networking.user.name, placeholder: "Name", title: "Name")
                .padding([.leading, .trailing, .bottom])

            HighlightableTextField(text: $networking.user.email, placeholder: "Email", title: "Email")
                .padding([.leading, .trailing, .bottom])

            HighlightableTextField(text: $networking.user.username, placeholder: "Username", title: "Username")
                .padding([.leading, .trailing, .bottom])

            HighlightableTextField(text: $networking.user.password, placeholder: "Password", title: "Password")
                .padding([.leading, .trailing, .bottom])

            DatePicker(selection: $networking.user.dateOfBirth, in: ...Date(), displayedComponents: .date) {
                Text("Date of Birth")
            }
                .padding([.leading, .trailing, .bottom])
                .foregroundColor(.gray)

            Text(networking.authErrorMessage)
                .foregroundColor(.red)
                .font(.footnote)
                .lineLimit(3)

            Spacer()


//            NavigationLink(
//                destination: SignUpSecondPage(),
//                label: {
//                    HStack {
//                        Text("Continue")
//                            .foregroundColor(.white)
//                    }
//                        .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0, maxHeight: 50, alignment: .center)
//                        .background(Color.orange)
//                        .modifier(WideButtonModifier())
//                })
            
            Button(action: ContinueButtonAction, label: {
                Text("Continue")
                    .foregroundColor(.white)
            })
                .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0,
                       maxHeight: 50, alignment: .center)
                .modifier(WideButtonModifier())
                .padding()
                

        }
            .padding([.bottom, .leading, .trailing])
            .padding(.top, -30)
    }
    
    
    
    func ContinueButtonAction() {
        self.networking.signUp()
        self.isVerificationCheckPagePresented = true
    }

//    @EnvironmentObject var networking: Networking
//
//    @State var isVerificationCheckPagePresented = false
//
//    var body: some View {
//        VStack {
//            NavigationLink(
//                destination: VerificationCheckPage(),
//                isActive: $isVerificationCheckPagePresented,
//                label: {
//                    EmptyView()
//                })
//
//            AuthParentPage(title: "Sign up") {
//                Auth.auth().createUser(withEmail: networking.email, password: networking.password) { authResult, error in
//
//                    guard error == nil else {
//                        print(error?.localizedDescription)
//                        networking.authErrorMessage = error?.localizedDescription ?? "unknown problem"
//                        return
//                    }
//
//                    print("User added to database")
//
//                    Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
//
//                        guard error == nil else {
//                            print(error?.localizedDescription)
//                            networking.authErrorMessage = error?.localizedDescription ?? "unknown problem sending email"
//                            return
//                        }
//
//                        print("Email Verification sent")
//
//                        self.isVerificationCheckPagePresented = true
//
//                    })
//                }
//            }
//        }
//    }
}
