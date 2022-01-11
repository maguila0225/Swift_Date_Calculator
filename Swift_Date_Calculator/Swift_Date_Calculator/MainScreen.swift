//
//  MainScreen.swift
//  Swift_Date_Calculator
//
//  Created by OPSolutions on 1/6/22.
//

import UIKit

let centuryDictonary: [Int:Int] = [0:2, 1:0, 2:5, 3:3]
let dayDictionary: [Int:String] = [0:"Sunday", 1:"Monday", 2:"Tuesday", 3:"Wednesday", 4:"Thursday", 5:"Friday", 6:"Saturday", -6:"Monday", -5:"Tuesday", -4:"Wednesday", -3:"Thursday", -2:"Friday", -1:"Saturday"]
let monthDictionary: [Int:Int] = [1:3, 2:28, 4:4, 6:6, 8:8, 10:10, 12:12, 5:9, 9:5, 7:11, 11:7, 3:14, 13:4, 14:29]


class MainScreen: UIViewController {
    @IBOutlet weak var yearDate: UITextField!
    @IBOutlet weak var monthDate: UITextField!
    @IBOutlet weak var dayDate: UITextField!
    @IBOutlet weak var getDay: UIButton!
    @IBOutlet weak var dayOfTheWeek: UILabel!
    @IBOutlet weak var nameField: UILabel!
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = data
    }
    
    @IBAction func getTheDay(_ sender: Any) {
        if validDateCheck() == true {
            let centuryKey: Int = (Int(yearDate.text!)! % 400) / 100
            let century = centuryDictonary[centuryKey]!
            let year: Int = Int(yearDate.text!)! % 100
            let leapYear: Int = (year / 4)
            let leapYearFlag: Bool = year % 4 == 0
            let piDayKey: Int = (century + year + leapYear) % 7
            var monthKey: Int = (Int(monthDate.text!)!)
            
            if leapYearFlag == true && monthKey == 1{
                monthKey = 13
            } else if leapYearFlag == true && monthKey == 2{
                monthKey = 14
            }
            
            let monthValue = monthDictionary[monthKey]!
            let dayDifference = Int(dayDate.text!)! - monthValue
            let dayKey = (piDayKey + dayDifference) % 7
            dayOfTheWeek.textColor = .black
            dayOfTheWeek.text = dayDictionary[dayKey]
        }
        else{
            dayOfTheWeek.textColor = .red
            dayOfTheWeek.text = "Invalid Date"
        }
    }
    
    func validDateCheck() -> Bool {
        let monthRange = 0 ... 12
        let thirtyDayRange = 1 ... 30
        let thirtyoneDayRange = 1 ... 31
        let feb28Range = 1 ... 28
        let feb29Range = 1 ... 29
        
        var dateIsValid: Bool = false
        
        if yearDate.text?.isEmpty == false &&
            monthDate.text?.isEmpty == false &&
            dayDate.text?.isEmpty == false &&
            monthRange.contains(Int(monthDate.text!)!) == true
            {
            switch Int(monthDate.text!)!{
                case 1, 3, 5, 7, 8, 10, 12:
                    if thirtyoneDayRange.contains(Int(dayDate.text!)!) == true{
                        dateIsValid = true
                    }
                case 4, 6, 9, 11:
                    if thirtyDayRange.contains(Int(dayDate.text!)!) == true{
                        dateIsValid = true
                    }
                case 2:
                if Int(yearDate.text!)! % 4 == 0{
                    if feb29Range.contains(Int(dayDate.text!)!) == true{
                        dateIsValid = true
                    }
                    else{
                        if feb28Range.contains(Int(dayDate.text!)!) == true{
                            dateIsValid = true
                        }
                    }
                }
                default:
                    dateIsValid = false
                }
            }
        return dateIsValid
    }
    
    @IBAction func logOut(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
