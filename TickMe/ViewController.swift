//
//  ViewController.swift
//  TickMe
//
//  Created by Yini Wang on 11/9/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicker = UIImagePickerController()
    @IBOutlet var imagePicked: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool)
    {
        //self.navigationItem.title = "Tickme"
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
            //when protected page id displayed, this will execuated, then present users
            // with the login view
            self.performSegue(withIdentifier: "loginView", sender: self);
        }
    }
    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey:"isUserLoggedin");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "loginView", sender: self);
        //let loginViewController = self.storyboard!.instantiateInitialViewControllerWithIdentifier("loginView") as LoginViewController
        //let loginViewController = storyboard!.instantiateInitialViewController(withIdentifier:"loginView") as LoginViewController
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //appDelegate.window?.rootViewController = loginViewController
        //appDelegate.window?.makeKeyAndVisible()
    }
    
    @IBAction func camerabuttonaction(_ sender: UIButton){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            imagePicker = UIImagePickerController()
            imagePicker.delegate  = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func photolibraryaction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            imagePicker = UIImagePickerController()
            imagePicker.delegate  = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    @IBAction func nextaction(_ sender: UIButton) {
        let imageData = UIImageJPEGRepresentation(imagePicked.image!, 0.99)
        let compressedJPEGimage = UIImage(data:imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGimage!, nil, nil, nil)
        saveNotice()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        var chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicked.contentMode = .scaleAspectFit
        imagePicked.image = chosenImage
        dismiss(animated:true, completion: nil)
    }/*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo:
        [NSObject : AnyObject]!) {
        imagePicked.image = image
        self.dismiss(animated: true, completion: nil);
        
    }*/
    func saveNotice(){
        let alertController = UIAlertController(title: "Image Saved!", message: "Your photo was successfully saved.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }
}


