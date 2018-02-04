//
//  LoginViewController.swift
//  TickMe
//
//  Created by Yini Wang on 11/12/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect{
        return bounds.insetBy(dx: 8, dy: 7)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}

class LoginViewController: UIViewController {

    @IBOutlet var userEmailTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        let userPasswordStore = UserDefaults.standard.string(forKey: "userPassword");
        
        func displayMyAlertMessage(userMessage:String)
        {
            let myAlert = UIAlertController(title:"Alert", message:userMessage,
                                            preferredStyle:
                UIAlertControllerStyle.alert); // used var before
            
            let okAction = UIAlertAction(title:"Ok", style:
                UIAlertActionStyle.default, handler:nil);
            
            myAlert.addAction(okAction);
            self.present(myAlert, animated: true,
                         completion:nil);
            
        }
        
        if(userEmailStored == userEmail)
        {
            if(userPasswordStore == userPassword)
            {
                // Login is successful
                UserDefaults.standard.set(true, forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil);
                
            }else{
                displayMyAlertMessage(userMessage:"Invalid email or password");
            }
        }
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
