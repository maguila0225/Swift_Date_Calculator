//
//  ViewController.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit
import IQKeyboardManager

var userDatabase: [String:String] = [:]
var inputUsername: String = ""


class ViewController: UIViewController {
    var registrationOK: Bool = false
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var createNewAccount: UIButton!
    @IBOutlet weak var logInWarning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDatabase["admin"] = "admin"
        password.isSecureTextEntry = true
        logInWarning.textColor = .cyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        email.text = ""
        username.text = ""
        password.text = ""
        if registrationOK == true {
        logInWarning.text = "Successful Registration"
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        logInWarning.text = ""
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

