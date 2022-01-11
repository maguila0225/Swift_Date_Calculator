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
    
    var okRegister: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordRegister.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true
    }
    
    @IBAction func registerUser(_ sender: Any) {
   
        if emailRegister.text!.isEmpty == false &&
            passwordRegister.text!.isEmpty == false &&
                passwordRegister.text == confirmPassword.text {
                userDatabase[emailRegister.text!] = passwordRegister.text!
                okRegister = true
                NSLog("\n Username: \(emailRegister.text!) \n Password; \(userDatabase[emailRegister.text!]!)")
            performSegue(withIdentifier: "returnToLogIn", sender: nil)
            }
            else{
                registerStatus.textColor = .red
                registerStatus.text = "Registration Failed"
            }
    }
    
    @IBAction func backButtonToLogIn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "returnToLogIn"{
            let logInScreen = segue.destination as! ViewController
            logInScreen.registrationOK = okRegister
        }
    }
}




