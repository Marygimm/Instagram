//
//  AuthService.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 20/05/2022.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage

}

struct AuthService {
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
    static func registerUser(withCredentials credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                
                guard let uniqueIdentifier = result?.user.uid, error == nil else {
                    print("Debug: Failed to register user \(error?.localizedDescription)")
                    return }
                
                let data: [String: Any] = ["email" : credentials.email,
                                           "fullname" : credentials.fullname,
                                           "profileImageUrl" : imageUrl,
                                           "uid" : uniqueIdentifier,
                                           "username" : credentials.username]
                
                Firestore.firestore().collection("users").document(uniqueIdentifier).setData(data, completion: completion)
            }
        }
    }
}
