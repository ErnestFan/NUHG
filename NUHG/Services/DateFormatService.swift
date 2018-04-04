//
//  DateFormatService.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-03-01.
//  Copyright © 2018 ERF. All rights reserved.
//

import Foundation
import UIKit

class DateFormatService {
    
    static let instance = DateFormatService()
    
    func dateFormatter(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    func hoursDifferenceBetweenDates(_ firstDate: String, _ secondDate: String) -> Int {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        if let first = dateFormatter.date(from: firstDate), let second = dateFormatter.date(from: secondDate) {
            let difference = Int(second.timeIntervalSince(first) / 3600)
            return difference
        }
        return -1
    }
}
