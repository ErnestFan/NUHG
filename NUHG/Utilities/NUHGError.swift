//
//  NUHGError.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-03-02.
//  Copyright © 2018 ERF. All rights reserved.
//

import Foundation

enum NUHGError: Error {
    case dateEmpty
    case gestationEmpty
    case dateDifference
    case sbEmpty
}

extension NUHGError {
    func getErrorDetail() -> String {
        switch(self) {
        case .dateDifference: return "Birth date has to be earlier than blood test date"
        case .dateEmpty: return "Date of Blood Test/Birth cannot be empty"
        case .gestationEmpty: return "Please select the duration of gestation"
        case .sbEmpty: return "SB value cannot be empty"
        }
    }
}
