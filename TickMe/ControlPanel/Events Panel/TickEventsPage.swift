//
//  TickEventsPage.swift
//  TickMe
//
//  Created by Boning Dong on 12/23/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class TickEventsPage: UIViewController {

    @IBOutlet var testButton : CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnToEventsPage(segue:UIStoryboardSegue) {
        print("Unwind Segue is Running!")
    }
}
