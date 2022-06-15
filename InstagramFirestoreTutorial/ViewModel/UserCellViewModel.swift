//
//  UserCellViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 15/06/2022.
//

import Foundation
struct UserCellViewModel {
    private let user: User
    
    var username: String {
        return user.username
    }
    
    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
