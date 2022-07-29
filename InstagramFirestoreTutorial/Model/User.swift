//
//  User.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 13/06/2022.
//

import Foundation
import Firebase

struct User {
    let email: String
    let fullname: String
    let profileImageUrl: String
    let uid: String
    let username: String
    
    var isFollowed: Bool = false
    
    var stast: UserStats
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.stast = UserStats(followers: 0, following: 0, posts: 0)
    }
}


struct UserStats {
    let followers: Int
    let following: Int
    let posts: Int
}
