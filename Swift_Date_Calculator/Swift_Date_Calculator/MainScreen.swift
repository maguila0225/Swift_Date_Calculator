//
//  MainScreen.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit

class MainScreen: UIViewController {

    @IBOutlet weak var nameField: UILabel!
    var observer: NSObjectProtocol?
//    var notification: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        observer = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: nKey), object: nil, queue: .main, using: { notification in
            
        })
        
//        guard let object = notification.object as String?
//        else{
//            return
//        }
//
//        guard case nameField.text = object
//        else{
//            return
//        }
    }
}
