//
//  ViewController.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit

var userDatabase: [String:String] = [:]
class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var createNewAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func emailEdit(_ sender: Any) {
        if email.text == "email"{
            email.text = nil;
            email.textColor = .black
        }
    }

    @IBAction func usernameEdit(_ sender: Any) {
        if username.text == "Name"{
            username.text = nil;
            username.textColor = .black
        }
    }
    @IBAction func passwordEdit(_ sender: Any) {
        if password.text == "Password"{
            password.text = nil
            password.textColor = .black
            password.isSecureTextEntry = true
        }
    }
    
    

}

