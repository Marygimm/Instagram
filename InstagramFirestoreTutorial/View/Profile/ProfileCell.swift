//
//  ProfileCell.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 13/06/2022.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    // MARK: - Properties
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "venom-7")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
