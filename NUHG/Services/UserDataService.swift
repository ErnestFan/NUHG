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
    
    func getGraphData() -> (sbP: [Double], ageP: [Double], sbET: [Double], ageET: [Double]) {
        if gestation == gestationData[0] {
            return (graphOne[0], graphOne[1], graphOne[2], graphOne[3])
        } else if gestation == gestationData[1] {
            return (graphTwo[0], graphTwo[1], graphTwo[2], graphTwo[3])
        } else if gestation == gestationData[2] {
            return (graphThree[0], graphThree[1], graphThree[2], graphThree[3])
        } else if gestation == gestationData[3] {
            return (graphFour[0], graphFour[1], graphFour[2], graphFour[3])
        } else if gestation == gestationData[4] {
            if riskFactor == true {
                return (graphFive[0], graphFive[1], graphFive[2], graphFive[3])
            } else {
                return (graphSix[0], graphSix[1], graphSix[2], graphSix[3])
            }
        } else if gestation == gestationData[5] {
            if riskFactor == true {
                return (graphSeven[0], graphSeven[1], graphSeven[2], graphSeven[3])
            } else {
                return (graphEight[0], graphEight[1], graphEight[2], graphEight[3])
            }
        }
        
        return ([0.0],[0.0],[0.0],[0.0])
    }
    
    
    
    
    
    
    
    
    
    
    
}
