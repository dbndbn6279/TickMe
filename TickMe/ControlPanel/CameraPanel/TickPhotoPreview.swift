//
//  TickPhotoPreview.swift
//  TickMe
//
//  Created by Boning Dong on 11/21/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit

class TickPhotoPreview: UIViewController {
    
    @IBOutlet var photoView: UIImageView!

    var capturedImage: UIImage?;
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        photoView.image = capturedImage!;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Outlet Funcitons */
    @IBAction func didClickReturnButton() {
        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func didClickNextButton() {
        performSegue(withIdentifier: "showRate_segue", sender: nil);
        //dismiss(animated: true, completion: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRate_segue" {
            let rateVC = segue.destination as! TickRatePanel;
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
