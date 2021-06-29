//
// Created by Aria Zare on 1/5/21.
//

import SwiftUI

struct SignUpProfileImagePicker: View {

    @EnvironmentObject var networking: Networking

    @State var showingImagePicker = false
    @State var image: Image?
    @State var inputImage: UIImage?
    @State var uploadProgress: Float = 0
    @State var isProgressViewHidden = true
    @State var progressViewLabelText = "Uploading..."
    @State var isCountinueButtonDisabled = true

    var body: some View {
        VStack(alignment: .center) {

            Text("Personalize the Experience")
                .bold()
                .foregroundColor(.orange)
                .font(.title)
                .padding([.bottom, .trailing, .leading])

            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("select an image")
                        .foregroundColor(.white)
                }
            }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .padding()
        }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            Text("Profile Photo")
                .foregroundColor(.gray)
            .padding()
        
        if !isProgressViewHidden {
            ProgressView(progressViewLabelText, value: uploadProgress, total: 1)
                .padding()
                .accentColor(.orange)
        }

        Spacer()

        NavigationLink(
            destination: SignUpMbtiPage(),
            label: {
                HStack {
                    Text("Continue")
                        .foregroundColor(.white)
                }
                    .frame(minWidth: 0, idealWidth: 200, maxWidth: .greatestFiniteMagnitude, minHeight: 0, idealHeight: 0, maxHeight: 50, alignment: .center)
                    .background(isCountinueButtonDisabled ? Color.gray : Color.orange)
                    .modifier(WideButtonModifier())
            })
        .disabled(isCountinueButtonDisabled)
        .padding()
        .padding([.bottom], 50)

    }

    func loadImage() {
        isCountinueButtonDisabled = true
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        isProgressViewHidden = false
        
        if let taskReference = networking.uploadProfileImageToFirebase(image: inputImage) {
            taskReference.observe(.progress) { (snapshot) in
                guard let fractionCompleted = snapshot.progress?.fractionCompleted else { return }
                print("upload profile Image \(fractionCompleted * 100)% completed")
                self.uploadProgress = Float(fractionCompleted)
            }
            
            taskReference.observe(.success) { (snapshot) in
                self.uploadProgress = 1
                progressViewLabelText = "Uploaded"
                isCountinueButtonDisabled = false
            }
        }
    }
}
