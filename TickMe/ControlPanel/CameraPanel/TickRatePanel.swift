//
//  TickRatePanel.swift
//  TickMe
//
//  Created by Boning Dong on 11/22/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class TickRatePanel: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Enter the Rate Panel")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Outlet Functions */
    @IBAction func didClickReturnButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didClickShareButton() {
        // Communicate with server.
        performSegue(withIdentifier: "returnToEventsPage", sender: self)
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
