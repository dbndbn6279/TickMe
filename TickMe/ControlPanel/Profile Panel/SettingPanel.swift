//
//  SettingPanel.swift
//  TickMe
//
//  Created by Boning Dong on 12/29/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class SettingPanel: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions
    @IBAction func returnToPrePage() {
        print("Return to previous page")
        dismiss(animated: true, completion: nil)
    }
}
