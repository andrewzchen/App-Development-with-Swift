//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Andrew Chen on 6/20/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var MainLabel: UILabel!
    
    @IBAction func changeTitle(_ sender: Any) {
        MainLabel.text = "This app rocks!"
    }
}

