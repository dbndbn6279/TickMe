//
//  CheckBox.swift
//  TickMe
//
//  Created by Boning Dong on 12/26/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    let borderColor:CGColor = UIColor.white.cgColor
    let activeColor:UIColor = UIColor.black
    let inactiveColor:UIColor = UIColor.white
    var isChecked:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Runinng init")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor
        self.setTitleColor(inactiveColor, for: .normal)
        print("Running coder")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.isChecked = !self.isChecked
        self.isChecked ? setTitleColor(activeColor, for: .normal) : setTitleColor(inactiveColor, for: .normal)
    }
    
    public func checkButton() {
        self.isChecked = true
        setTitleColor(activeColor, for: .normal)
    }
    
    public func uncheckButton() {
        self.isChecked = false
        setTitleColor(inactiveColor, for: .normal)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
