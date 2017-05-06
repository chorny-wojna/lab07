//
//  ViewController.swift
//  lab07_TP3
//
//  Created by fpmi on 29.04.17.
//  Copyright (c) 2017 Raman Baranaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicatorLabel: UILabel!
    @IBOutlet weak var backgroundSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        indicatorLabel.textColor = UIColor.whiteColor()
        indicatorLabel.text = "Background image: bg2.jpg"
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)
    }

    @IBAction func backgroundSwitchTapped(sender: AnyObject) {
    
       if backgroundSwitch.on
        {
            indicatorLabel.text = "Background image: bg1.jpg"
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        }
        else
        {
            indicatorLabel.text = "Background image: bg2.jpg"
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)
        }
    
        
    }

}

