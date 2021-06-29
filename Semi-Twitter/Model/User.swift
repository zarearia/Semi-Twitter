//
//  File.swift
//  Rhythms
//
//  Created by Aria Zare on 2/22/21.
//

import CoreImage
import Firebase

class User {
    
    var email: String {
        didSet {
            defaults.setValue(email, forKey: emailKey)
        }
    }
    
    var password: String {
        didSet {
            defaults.setValue(password, forKey: passwordKey)
        }
    }

    var name: String {
        didSet {
            defaults.setValue(name, forKey: nameKey)
        }
    }

    var username: String {
        didSet {
            defaults.setValue(username, forKey: usernameKey)
        }
    }

    var dateOfBirth: Date {
        didSet {
            defaults.setValue(dateOfBirth, forKey: dateOfBirthKey)
        }
    }

    var profilePhoto: UIImage?
    
    //MARK: Only use this if the User is initialized
    func initProfilePhoto(completion: @escaping (UIImage) -> Void) {
        Networking.networking.downloadProfileImage(username: self.username) { image in
            Networking.networking.profileImages[self.username] = image
            self.profilePhoto = image
            print("image = \(image)")
            completion(image)
        }

    }

    var personalityType: MBTIType

    var rhythems: [Tweet]?

    var dictionary: [String: Any] {
        return [
            "email": email,
            "password": password,
            "name": name,
            "username": username,
            "dateOfBirth": dateOfBirth,
            "personalityType": personalityType.rawValue,
        ]
    }
    
    init(email: String, name: String, password: String, username: String, dateOfBirth: Date, personalityType: MBTIType) {
        self.email = email
        self.name = name
        self.password = password
        self.username = username
        self.dateOfBirth = dateOfBirth
        self.personalityType = personalityType
    }
    
    convenience init?(dictionary: [String: Any]) {
        
        guard let date = dictionary["dateOfBirth"] as? Timestamp else {
            return nil
        }
        
        let dateOfBirth = Date(timeIntervalSince1970: TimeInterval(date.seconds))
        
        guard let email = dictionary["email"] as? String,
            let password = dictionary["password"] as? String,
            let name = dictionary["name"] as? String,
            let username = dictionary["username"] as? String,
//            let dateOfBirth = dictionary["dateOfBirth"] as? Date,
            let personalityType = dictionary["personalityType"] as? String
        else {
            return nil
        }
        
        self.init(email: email,
                  name: name,
                  password: password,
                  username: username,
                  dateOfBirth: dateOfBirth,
                  personalityType: MBTIType(rawValue: personalityType) ?? .XXXX)
        
    }
    
}
