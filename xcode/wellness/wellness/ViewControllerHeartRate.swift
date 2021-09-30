//
//  ViewControllerHeartRate.swift
//  wellness
//
//  Created by John Albright on 5/14/21.
//  Copyright © 2021 John Albright. All rights reserved.
//

import UIKit

class ViewControllerHeartRate: UIViewController {
    
    // Link the GUI objects
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var progressViewTime: UIProgressView!
    @IBOutlet weak var txtPulses: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var lblHeartRate: UILabel!
    @IBOutlet weak var lblHeartRateRanges: UILabel!
    
    // declare variables to be used in the class
    var myTimer: Timer?
    var counter:Int = 0
    
    func displayTime() {
        // Increment the counter and change the time label
        counter += 1
        lblTime.text = ("\(counter) second(s)")
        
        let fractionalProgress = Float(counter) / 15
        let animated = counter != 0
        
        // Update the progress view
        progressViewTime.setProgress(fractionalProgress, animated: animated)
        
        
        // Stop the timer once 15 is reached
        if counter == 15 {
            myTimer?.invalidate()
        }
    }
    
    // Create the action for the button
    @IBAction func HeartRateTimer(_ sender: Any) {
        
        // Set the timer and initialize the progress view
        counter = 0
        progressViewTime.setProgress(0, animated: true)
        
        // Initialize and start the timer
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: #selector(displayTime),
                             userInfo: nil,
                             repeats: true)
        
    }
    
    
    @IBAction func CalculateHeartRate(_ sender: UIButton) {
        // Extract text from text boxes
        let pulses = Int(txtPulses.text!)
        let age = Int(txtAge.text!)
        let heartRate:Int
        let heartRange:String
        
        // Calculate and display the heart rate
        heartRate = pulses! * 4
        lblHeartRate.text = (heartRate as NSNumber).stringValue
        
        // Determine the heart range based on the age
        switch (age!) {
        case 0..<20:
            heartRange = "100-170 bpm"
        case 20..<30:
            heartRange = "95-162 bpm"
        case 30..<35:
            heartRange = "93-157 bpm"
        case 35..<40:
            heartRange = "90-153 bpm"
        case 40..<45:
            heartRange = "88-149 bpm"
        case 45..<50:
            heartRange = "85-145 bpm"
        case 55..<60:
            heartRange = "83-140 bpm"
        case 60..<65:
            heartRange = "80-136 bpm"
        case 65..<70:
            heartRange = "78-132 bpm"
        default:
            heartRange = "75-128 bpm"
        }
        
        // Display the heart range
        lblHeartRateRanges.text = "Target heart rate range: " + heartRange
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Initialize the progress view to 0
        progressViewTime.setProgress(0, animated: true)
        
        // Initialize the label 
        lblTime.text = ""
        lblHeartRate.text = ""
        lblHeartRateRanges.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
