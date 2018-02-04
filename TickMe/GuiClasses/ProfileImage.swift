//
//  ProfileImage.swift
//  TickMe
//
//  Created by Boning Dong on 12/27/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class ProfileImage: UIImageView {
    
    let borderColor:CGColor = UIColor.white.cgColor
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("Running coder init")
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 2
        self.clipsToBounds = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 2
        print("Profile Image draw method run")
    }

}
