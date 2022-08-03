//
//  CustomButton.swift
//  InstagramFirestoreTutorial
//
//  Created by Mary Moreira on 17/05/2022.
//

import UIKit


class CustomButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor.systemPurple.withAlphaComponent(0.5)
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
