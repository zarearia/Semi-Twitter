//
//  VerificationCheckPage.swift
//  Rhythms
//
//  Created by Aria Zare on 12/20/20.
//

import SwiftUI
import Firebase

struct VerificationCheckPage: View {
    
    @EnvironmentObject var networking: Networking
    
    @State var isEmailVerified = false
    @State var goToSignUpProfileImagePicker = false
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: SignUpProfileImagePicker(),
                isActive: $goToSignUpProfileImagePicker,
                label: {
                    EmptyView()
                }
            )
            
            Text("email verification status: \(isEmailVerified ? "true" : "false")")
            
            Button(action: {
//                isEmailVerified = Auth.auth().currentUser?.isEmailVerified ?? false
                
                Auth.auth().signIn(withEmail: networking.user.email, password: networking.user.password) { (authDataResult, error) in
                    if Auth.auth().currentUser?.isEmailVerified ?? false {
                        
                        //TODO: This part may need to be changed again
//                        networking.isUserSignedIn()
                        
                        goToSignUpProfileImagePicker = true
                        
                    }
                }
                
                print(Auth.auth().currentUser?.isEmailVerified)
                
//                if isEmailVerified {
//                    networking.isUserSignedIn()
//                    print("email is verified")
//                } else {
//                    print("email is not verified")
//                }
                
            }, label: {
                Text("Check verification")
            })
        }
        
    }
    
}

//struct VerificationCheckPage_Previews: PreviewProvider {
//    static var previews: some View {
//        VerificationCheckPage()
//    }
//}
