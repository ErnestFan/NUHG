//
//  UserDataServices.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-02-28.
//  Copyright © 2018 ERF. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public var gestation = "Select weeks"
    public var riskFactor = false
    public var dateOfBirth = "Select Date"
    public var dateOfBloodTest = "Select Date"
    public var sbValue = 0
    
    func getDateDifferenceInHours() -> Int {
        if dateOfBloodTest != "Select Date" && dateOfBirth != "Select Date" {
            return DateFormatService.instance.hoursDifferenceBetweenDates(dateOfBirth, dateOfBloodTest)
        } else {
            print("Error: Please Select Date")
        }
        return -1
    }
}
