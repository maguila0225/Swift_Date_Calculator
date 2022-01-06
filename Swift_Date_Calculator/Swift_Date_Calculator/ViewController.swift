//
//  ViewController.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit

var userDatabase: [String:String] = [:]
let nKey = "payload"

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var createNewAccount: UIButton!
    @IBOutlet weak var logInWarning: UILabel!
    
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
    
    @IBAction func logInAttempt(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: nKey), object: username.text)
        if  email.text!.isEmpty == false &&
            password.text == userDatabase[email.text!]{
            let vc = storyboard?.instantiateViewController(withIdentifier: "screen2") as! MainScreen
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        else{
            logInWarning.textColor = .red
            logInWarning.text = "Invalid Username/Password!"
        }
        
    }
    
    

}

