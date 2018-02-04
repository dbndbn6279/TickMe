//
//  BlockButton.swift
//  TickMe
//
//  Created by Boning Dong on 12/27/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class BlockButton: UIButton {
    
    let borderColor:CGColor = UIColor.darkGray.cgColor
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor
        self.setTitle("", for: .normal)
    }
}
