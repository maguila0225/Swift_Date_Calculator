//
//  RegisterScreen.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit

class RegisterScreen: UIViewController {
    @IBOutlet weak var emailRegister: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var passwordRegister: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func enterRegisterEmail(_ sender: Any) {
        if emailRegister.text == "email"{
            emailRegister.text = nil;
            emailRegister.textColor = .black
        }
    }
    @IBAction func enterRegisterPassword(_ sender: Any) {
        if passwordRegister.text == "Password"{
            passwordRegister.text = nil;
            passwordRegister.textColor = .black
            passwordRegister.isSecureTextEntry = true
        }
    }
    @IBAction func enterConfirmPassword(_ sender: Any) {
        if confirmPassword.text == "Password"{
            confirmPassword.text = nil;
            confirmPassword.textColor = .black
            confirmPassword.isSecureTextEntry = true
        }
    }
    
    @IBAction func registerUser(_ sender: Any) {
   
        if emailRegister.text!.isEmpty == false &&
            passwordRegister.text!.isEmpty == false &&
                passwordRegister.text == confirmPassword.text {
                userDatabase[emailRegister.text!] = passwordRegister.text!
                registerStatus.textColor = .cyan
                registerStatus.text = "Successful Registration"
                NSLog("\n Username: \(emailRegister.text!) \n Password; \(userDatabase[emailRegister.text!]!)")
            }
            else{
                registerStatus.textColor = .red
                registerStatus.text = "Registration Failed"
            }
    }
}
