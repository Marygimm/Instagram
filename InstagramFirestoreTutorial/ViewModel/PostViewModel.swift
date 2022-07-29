//
//  PostViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 29/07/2022.
//

import Foundation

struct PostViewModel {
    private let post: Post
    
    var imageUrl: URL? {
        return URL(string: post.imageUrl)
    }
    
    var profileUserUrl: URL? {
        return URL(string: post.ownerImageUrl)
    }
    
    var username: String {
        return post.ownerUsername
    }
    
    var caption: String {
        return post.caption
    }
    
    var likes: String {
        return "\(post.likes) likes"
    }
    
    init(post: Post) {
        self.post = post
    }
}
