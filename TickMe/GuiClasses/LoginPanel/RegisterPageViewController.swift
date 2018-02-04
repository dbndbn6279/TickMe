//
//  RegisterPageViewController.swift
//  TickMe
//
//  Created by Yini Wang on 11/12/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet var userEmailTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        func displayMyAlertMessage(userMessage:String)
        {
            let myAlert = UIAlertController(title:"Alert", message:userMessage,
                                            preferredStyle:
                UIAlertControllerStyle.alert); //used var before
            
            let okAction = UIAlertAction(title:"Ok", style:
                UIAlertActionStyle.default, handler:nil);
            
            myAlert.addAction(okAction);
            self.present(myAlert, animated: true,
                         completion:nil);
            
            //ref?.child("Register").childByAutoId().setValue("Hello")
            
        }
        
        // Check for empty fields
        if(userEmail == "" || userPassword == "" ||
            userRepeatPassword == "")
        {
            // Display alert message
            displayMyAlertMessage(userMessage:"All fields are required");
            return;
            
        }
        
        // Check if passwords match
        if(userPassword != userRepeatPassword)
        {
            // Display an alert message
            displayMyAlertMessage(userMessage:"Password does not match");
            return;
        }
        
        // Store data  (locally -> for now)
        UserDefaults.standard.set(userEmail, forKey:"userEmail");
        UserDefaults.standard.set(userPassword, forKey:"userPassword");
        UserDefaults.standard.synchronize();
        
        
        // Display alert message with confirmation
        let myAlert = UIAlertController(title:"Congratulations!", message:"Registration is done",preferredStyle:
            UIAlertControllerStyle.alert); //var
        
        let okAction = UIAlertAction(title:"Ok", style:
        UIAlertActionStyle.default){ action in
            self.dismiss(animated:true, completion:nil);
        }
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
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
