//
//  OutlinedButton.swift
//  TickMe
//
//  Created by Boning Dong on 12/27/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class OutlinedButton: UIButton {

    let borderColor:CGColor = UIColor.white.cgColor
    let textColor:UIColor = UIColor.white
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor
        self.setTitleColor(textColor, for: .normal)
    }

}
