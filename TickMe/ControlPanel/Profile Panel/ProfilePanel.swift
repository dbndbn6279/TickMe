//
//  ProfilePanel.swift
//  TickMe
//
//  Created by Boning Dong on 12/27/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class ProfilePanel: UIViewController {

    // Apperance related config
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // Others
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions
    @IBAction func didClickSetting() {
        print("Clicked Settings")
        performSegue(withIdentifier: "SettingSegue", sender: nil)
    }
    
    @IBAction func didClickEditProfile() {
        print("Clicked Edit Profile")
        performSegue(withIdentifier: "EditProfileSegue", sender: nil)
    }
    
    @IBAction func didClickTicks() {
        print("Clicked Ticks")
    }
    
    @IBAction func didClickFollowers() {
        print("Clicked Followers")
    }
    
    @IBAction func didClickFollowing() {
        print("Clicked Following")
    }

}
