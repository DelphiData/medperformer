//
//  ForgotPasswordViewController.swift
//  MedPerformer
//
//  Created by Lonnie J. Bargo on 10/25/14.
//  Copyright (c) 2014 Lonnie J. Bargo. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    
   
   
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func submitEmail(sender: AnyObject) {
        
        
        var initialEmail = emailField.text
        var email = initialEmail.lowercaseString
        var finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        PFUser.requestPasswordResetForEmailInBackground(finalEmail) { (success: Bool, error: NSError!) -> Void in
            if (error == nil) {
                var success = UIAlertController(title: "Success", message: "Success! Check your email!", preferredStyle: .Alert)
                var okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                success.addAction(okButton)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(success, animated: false, completion: nil)
                })
            }else {
                var errormessage = error.userInfo!["error"] as NSString
                var error = UIAlertController(title: "Cannot complete request", message: errormessage, preferredStyle: .Alert)
                var okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                error.addAction(okButton)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(error, animated: false, completion: nil)
                })
                
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
            emailField.resignFirstResponder()
            return true
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


