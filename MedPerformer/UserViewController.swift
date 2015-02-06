//
//  UserViewController.swift
//  MedPerformer
//
//  Created by Lonnie J. Bargo on 10/22/14.
//  Copyright (c) 2014 Lonnie J. Bargo. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBAction func logout(sender: AnyObject) {
        PFUser.logOut()
        
        
        self.performSegueWithIdentifier("logoutlogin", sender: self)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
