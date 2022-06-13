//
//  ImageUploader.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 20/05/2022.
//

import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void ) {
        guard let imageDate = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let reference = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        reference.putData(imageDate, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
            }
            
            reference.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}

