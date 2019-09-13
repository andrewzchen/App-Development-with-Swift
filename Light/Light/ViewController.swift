//
//  ViewController.swift
//  Light
//
//  Created by Andrew Chen on 6/20/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

 
    
    @IBAction func buttonPressed(_ sender: Any) {
        // toggle switches
        // boolean value
        lightOn.toggle()
        updateUI()
    }
    func updateUI() {
//        if lightOn {
//            view.backgroundColor = .white
////            lightButton.setTitle("off", for: .normal)
//        }
//        else {
//            view.backgroundColor = .black;
////            lightButton.setTitle("on", for: .normal)
//        }
        view.backgroundColor = lightOn ? .white : .black
    }
    
}
