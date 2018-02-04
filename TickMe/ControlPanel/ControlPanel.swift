//
//  ControlPanel.swift
//  TickMe
//
//  Created by Boning Dong on 11/12/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class ControlPanel: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        if(!isUserLoggedIn)
        {
            //when protected page id displayed, this will execuated, then present users
            // with the login view
            self.performSegue(withIdentifier: "loginView", sender: self);
        }
    }
    
    
}
