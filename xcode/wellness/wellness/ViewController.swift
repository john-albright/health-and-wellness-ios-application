//
//  ViewController.swift
//  wellness
//
//  Created by John Albright on 5/1/21.
//  Copyright © 2021 John Albright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Link UI elements to variables
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var btnCalc: UIButton!
    
    @IBAction func calc(_ sender: UIButton) {
        
        // Extract the height and weight from the text boxes and store them
        let wt = Double(txtWeight.text!)
        let ht = Double(txtHeight.text!)
        let BMI:Double
        let BMImod:Double
        var status:String
        
        // Guard the calculations with an if statement making sure wt and ht are not nil values
        if (wt != nil && ht != nil) {
            
            // Calculate the BMI
            BMI = ((wt! * 703.0) / (ht! * ht!));
            
            // Round the BMI to 2 decimal places
            BMImod = round(BMI * 100) / 100.0
            
            // Display the BMI
            lblBMI.text = (BMImod as NSNumber).stringValue
            
            // Determine the status message and launch alert message if applicable
            switch (BMImod) {
            case 0..<18.5:
                status = "Underweight"
            case 18.5..<25:
                status = "Normal Weight"
                healthyAlert()
            case 25..<30:
                status = "Overweight"
            case 30..<40:
                status = "Obese"
                obesityAlert(thisTitle: "High BMI")
            default:
                status = "Morbidly Obese"
                obesityAlert(thisTitle: "Extremely High BMI")
            }
            
            // Display the status 
            lblStatus.text = status
        }
    }
    
    func obesityAlert(thisTitle: String) {
        // Create an alert controller for obese people
        let alertController = UIAlertController(title: thisTitle, message: "Lose weight now or Dr. Feelgood will be calling you very soon!!!", preferredStyle: .alert)
        
        // Create an alert action
        let action1 = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // Add action to the alert controller
        alertController.addAction(action1)
        
        // Display the alert controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func healthyAlert() {
        let alertController = UIAlertController(title: "Healthy BMI", message: "Your weight is in a healthy range. Stay healthy!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Clear the calculated labels 
        lblBMI?.text = nil
        lblStatus?.text = nil
        
        let swiftColor = UIColor(red: 0, green: 130/255, blue: 255/250, alpha: 1)
        
        // Modify the Calculate button
        btnCalc?.backgroundColor = swiftColor
        btnCalc?.layer.cornerRadius = 25
        btnCalc?.setTitleColor(UIColor.white, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

