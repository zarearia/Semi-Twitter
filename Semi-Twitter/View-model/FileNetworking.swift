//
//  FileNetworking.swift
//  Rhythms
//
//  Created by Aria Zare on 2/27/21.
//

import SwiftUI
import Firebase
import FirebaseStorage

var profilePhotoStringExtension = "_profilePhoto.jpg"

extension Networking {
    
    func uploadProfileImageToFirebase(image: UIImage) -> StorageUploadTask? {
        let uploadRef = storage.reference(withPath: "profilePhotos/\(user.username)\(profilePhotoStringExtension)")
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return nil }
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg"
        
        let taskReference = uploadRef.putData(imageData, metadata: uploadMetadata) { (downnloadMetaData, error) in
            if let error = error {
                print("failed to upload profile photo to firebase: \(error.localizedDescription)")
                return
            }
            print("profile photo successfully uploaded: \(String.init(describing: downnloadMetaData))")
        }
        
        return taskReference
    }
    
    func downloadProfileImage(username: String, completion: @escaping (UIImage) -> Void) {
//        let downloadRef = storage.reference(withPath: "profilePhotos/\(username)\(profilePhotoStringExtension)")
        let downloadRef = storage.reference(forURL: "gs://rhythm-127b4.appspot.com/profilePhotos/\(username)_profilePhoto.jpg")
        
        downloadRef.getData(maxSize: 10*1024*1024) { data, error in
            if let error = error {
                print("error downloading @\(username)'s profile photo: \(error)")
            } else {
                let image = UIImage(data: data!)
                completion(image!)
            }
        }
        
        //save to url (doesn't work properly beccause the url is not appropriate)
//        let localURL = URL(string: "path/to/image")!
//
//        print("Here")
//        // Download to the local filesystem
//        let downloadTask = downloadRef.write(toFile: localURL) { url, error in
//          if let error = error {
//            print("Error downloading profilePhoto: \(error)")
//            // Uh-oh, an error occurred!
//          } else {
//            // Local file URL for "images/island.jpg" is returned
//            print("URL: \(url)")
////            if let filePath = Bundle.main.path(forResource: url, ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
////                completion(image)
////            }
//          }
//        }
//        downloadTask.observe(.resume, handler: { snapshot in
//            print(snapshot.progress?.fractionCompleted)
//        })
    }
    
}
