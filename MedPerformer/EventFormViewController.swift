//
//  EventFormViewController.swift
//  MedPerformer
//
//  Created by Lonnie J. Bargo on 10/21/14.
//  Copyright (c) 2014 Lonnie J. Bargo. All rights reserved.
//

import UIKit

var eventChoices = [
    ["5","10","15","30","45","60","90","120","150","180"],
    ["Hospital Committee","Peer Review","EHR Improvement","Quality Improvement","Business Development"],
]

class EventFormViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    
    
    @IBOutlet weak var eventPicker: UIPickerView!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var commentField: UITextField!
    
    func updateLabel(){
        let selectedTime = eventChoices[0][eventPicker.selectedRowInComponent(0)]
        let event = eventChoices[1][eventPicker.selectedRowInComponent(1)]
        
        
        eventLabel.text = "Chose \(event) for \(selectedTime) mins"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedDuration = eventChoices[0][eventPicker.selectedRowInComponent(0)]
        let eventSelected = eventChoices[1][eventPicker.selectedRowInComponent(1)]
        var selectedDuraNum = selectedDuration.toInt()
        var user = PFUser.currentUser()
        var event = PFObject(className: "event")
        event.setObject(eventSelected, forKey: "category")
        event.setObject(selectedDuraNum, forKey: "duration")
        event.setObject(commentField.text, forKey: "comment")
        event.setObject(user, forKey: "user")
        event.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            
            if success == true {
            println("event created")
            }
            else {
            println(error)
            }
        
        }

        //playing with query
        /*var query = PFQuery(className: "event")
        query.whereKey("user", equalTo: user)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    NSLog("%@", object.objectId)
                }
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }*/
        
        // Do any additional setup after loading the view.


    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return eventChoices.count
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    
        return eventChoices[component].count
    
    
    
    }
    
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return eventChoices[component][row]
   }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if (component == 0) {
            return 50.0;
        }
        return 300.0;
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


