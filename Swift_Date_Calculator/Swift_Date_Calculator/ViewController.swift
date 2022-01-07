//
//  ViewController.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit

var userDatabase: [String:String] = [:]
var inputUsername: String = ""

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
        if email.text?.isEmpty == false &&
            username.text?.isEmpty == false &&
            password.text == userDatabase[email.text!]{
            logInWarning.text = ""
            performSegue(withIdentifier: "showScreen2", sender: nil)
        }
        else{
            logInWarning.textColor = .red
            logInWarning.text = "Log In Failed"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScreen2"{
            let secondScreen = segue.destination as! MainScreen
            secondScreen.data = username.text
        }
    }
}

