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
    
    
    func updateLabel()
    {
        let selectedTime = eventChoices[0][eventPicker.selectedRowInComponent(0)]
        let event = eventChoices[1][eventPicker.selectedRowInComponent(1)]
        
        
        eventLabel.text = "Chose \(event) for \(selectedTime) mins"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        updateLabel()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return eventChoices.count
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return eventChoices[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return eventChoices[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
    
        if (component == 0)
        {
            return 50.0;
        }
            return 300.0;
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