//
//  ViewController.swift
//  Login
//
//  Created by Andrew Chen on 7/3/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var usernameField: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // as? casts sender to UIButton, returns nil
        // if cast fails
        guard let sender = sender as? UIButton else {return}
        if segue.identifier == "Login Button Segue" {
            segue.destination.navigationItem.title = usernameField.text
        }
        else if segue.identifier == "Login Screen Segue" {
            if sender == forgotUsername {
                 segue.destination.navigationItem.title = "Forgot User Name"
            }
            else {
            segue.destination.navigationItem.title = "Forgot Password"
            }
        }
    }
    @IBOutlet var forgotUsername: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    @IBAction func forgotUsernamePress(_ sender: Any) {
        performSegue(withIdentifier: "Login Screen Segue", sender: forgotUsername)
    }
    @IBAction func forgotPasswordPress(_ sender: Any) {
        performSegue(withIdentifier: "Login Screen Segue", sender: forgotPassword)
    }
}

