//
//  ViewController.swift
//  MedPerformer
//
//  Created by Lonnie J. Bargo on 10/19/14.
//  Copyright (c) 2014 Lonnie J. Bargo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//Login stuff
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView ()
    func displayAlert(title:String, error:String) {
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in
            self.dismissViewControllerAnimated(true, completion: nil)}))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBAction func signUp(sender: AnyObject) {
       
        var error = ""
        
        if username.text == "" || password.text == "" {
            
            error = "Please enter a username and password"
            
        }
        
        
        if error != "" {
            
            displayAlert("Error In Form", error: error)
            
        } else {
            
            
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            
                
                var user = PFUser()
                user.username = username.text
                user.password = password.text
                user.email = email.text
                
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool!, signupError: NSError!) -> Void in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    if signupError == nil  {
                        // Hooray! Let them use the app now.
                        self.performSegueWithIdentifier("JumpToHome", sender: self)
                        println("signed up")
                        
                        
                    } else {
                        if let errorString = signupError.userInfo?["error"] as? NSString {
                            
                            error = errorString
                            
                        } else {
                            
                            error = "Please try again later."
                            
                        }
                        
                        self.displayAlert("Could Not Sign Up", error: error)
                        
                    }
                }
                
            }
        
        
    }
    
    
    
    
    
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
    
        
        // Do any additional setup after loading the view, typically from a nib.}
}
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
        self.performSegueWithIdentifier("JumpToHome", sender: self)
        
        
        
        }
        
        
        
        
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //next to functs close keyboard
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        username.resignFirstResponder()
        password.resignFirstResponder()
        email.resignFirstResponder()
        return true
    } // called when 'return' key pressed. return NO to ignore.


}

