//
//  ViewController.swift
//  lab07_04
//
//  Created by Admin on 06.05.17.
//  Copyright © 2017 ParnasusIndustries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureIndicator: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gestureIndicator.isUserInteractionEnabled = true
        gestureIndicator.textAlignment = NSTextAlignment.center
        gestureIndicator.numberOfLines = 2
        gestureIndicator.text = "Используйте жесты в этой области"
        gestureIndicator.backgroundColor = UIColor.yellow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
        

        
        @IBAction func tap(_ sender: Any) {
            gestureIndicator.text = "Жест: касание\nЦвет фона: зеленый"
            gestureIndicator.backgroundColor = UIColor.green
        }
        
    @IBAction func longPress(_ sender: Any) {
        gestureIndicator.text = "Жест: долгое нажатие\nЦвет фона: оранжевый"
        gestureIndicator.backgroundColor = UIColor.orange
        
    }

        
        @IBAction func pinch(_ sender: Any) {
            gestureIndicator.text = "Жест: масштабирование\nЦвет фона: красный"
            gestureIndicator.backgroundColor = UIColor.red
        }
    
        
        @IBAction func rotation(_ sender: Any) {
            gestureIndicator.text = "Жест: вращение\nЦвет фона: синий"
            gestureIndicator.backgroundColor = UIColor.blue
        }
        
    
        @IBAction func swipe(_ sender: Any) {
            gestureIndicator.text = "Жест: смахивание\nЦвет фона: серый"
            gestureIndicator.backgroundColor = UIColor.gray
        }
}

