//
// Created by Aria Zare on 1/5/21.
//

import SwiftUI

struct SignUpMbtiPage: View {

    var types = ["INTJ", "INTP", "ENTJ", "ENTP", "INFJ", "INFP", "ENFJ", "ENFP",
                 "ISTJ", "ISFJ", "ESTJ", "ESFJ", "ISTP", "ISFP", "ESTP", "ESFP"]
    @State private var selectedType = 0
    @EnvironmentObject var networking: Networking
    let locationManager = LocationManager.locationManager

    var body: some View {
        VStack(alignment: .center) {
            Text("Personalize the Experience")
                .bold()
                .foregroundColor(.orange)
                .font(.title)
                .padding([.bottom, .trailing, .leading])

            Text("Myers–Briggs Type Indicator")
                .bold()
                .foregroundColor(.gray)
                .font(.title2)

            Picker(selection: $selectedType, label: Text("Myers–Briggs Type Indicator")) {
                ForEach(0 ..< types.count) {
                    Text(self.types[$0])
                }
            }
                .frame(height: 60)
                .clipped()

//            Text("Or")
//                .bold()
//                .foregroundColor(.gray)
//                .font(.body)

            Button(action: {
                guard let url = URL(string: "https://www.16personalities.com/") else { return }
                UIApplication.shared.open(url)
            }) {
                Text("I don't know my type, take the test!")
                    .foregroundColor(.orange)
            }
                .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0,
                    maxHeight: 50, alignment: .center)
                .modifier(WideButtonConerColorModifier())
                .padding()

            Text("Rhythm is currently using 16personalities.com MBTI test to personalize the experience")
                .bold()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(height: 70)
                .padding()

            Button(action: {
//                TODO: Navigate to what is MBTI Page
            }) {
                Text("What is MBTI?")
                    .foregroundColor(.orange)
            }

            Button(action: {
//                TODO: CoreLocation Button
                networking.setUserLocation()
            }) {
                Text("Allow to detect my location")
                    .foregroundColor(.orange)
            }
                .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0,
                    maxHeight: 50, alignment: .center)
                .modifier(WideButtonConerColorModifier())
                .padding()

            HStack {
                Text("By clicking on the sign up button you agree our ") + Text("Terms of Service and Privacy Policy").foregroundColor(.orange)
            }
                .onTapGesture {
//                    TODO: Navigate to term of service
                }

            Button(action: {
//                TODO: Sign up Button
                networking.user.personalityType = MBTIType.init(rawValue: self.types[selectedType]) ?? MBTIType.XXXX
                networking.updateUserInCloud()
                networking.setUserLocation()
                networking.isUserSignedIn()
                
                
            }) {
                Text("Sign up")
                    .foregroundColor(.white)
            }
                .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0,
                    maxHeight: 50, alignment: .center)
                .modifier(WideButtonModifier())
                .padding()

        }
            .padding(.top, -50)
            .padding()
    }

}
