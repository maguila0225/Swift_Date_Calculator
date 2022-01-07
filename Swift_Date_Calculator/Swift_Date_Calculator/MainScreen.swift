//
//  MainScreen.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit

class MainScreen: UIViewController {
    var data: String?
    @IBOutlet weak var nameField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = data
    }
}
