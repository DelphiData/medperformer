//
//  LoginViewController.swift
//  MedPerformer
//
//  Created by Lonnie J. Bargo on 10/20/14.
//  Copyright (c) 2014 Lonnie J. Bargo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    
    
    
    
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
    
    
    
    @IBAction func login(sender: AnyObject) {
        
        
        var error = ""
        
        if username.text == "" || password.text == "" {
            
            error = "Please enter a username and password"
            
        }
        
        if error != ""  {
            displayAlert("Error In Form", error: error)
            
        }
            
        else {
            
            
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
                (user: PFUser!, signupError: NSError!) -> Void in
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if signupError == nil {
                    self.performSegueWithIdentifier("LogToHome", sender: self)
                    // Do stuff after successful login.
                } else {
                    if let errorString = signupError.userInfo?["error"] as? NSString {
                        error = errorString
                    } else {
                        error = "Please try again later."
                    // The login failed. Check error to see why.
                }
                    self.displayAlert("Could not Log In", error: error)
                    // Show the errorString somewhere and let the user try again.
            }
            
            
                
                    
                
            }
            
        }
        
        
        
    }
    
    

    
    
    
 
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
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
        return true
    
    } // called when 'return' key pressed. return NO to ignore
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
