//
//  ViewControllerVideo.swift
//  wellness
//
//  Created by John Albright on 5/13/21.
//  Copyright © 2021 John Albright. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerVideo: UIViewController {
    
    // Connect the web view to the controller
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Declare the url link as a string
        let htmlUrl = "<iframe width='450' height='250' src='https://www.youtube.com/embed/TUlm_S2qTG4' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
        
        // Load the html string in the web view
        webView.loadHTMLString(htmlUrl, baseURL: nil)
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
