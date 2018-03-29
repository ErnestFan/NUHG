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
    case dateMinimum
    case sbMinimum
}

extension NUHGError {
    func getErrorDetail() -> String {
        switch(self) {
        case .dateEmpty: return "Date of Birth and Date of Blood Test cannot be empty"
        case .gestationEmpty: return "Please select the duration of Gestation"
        case .dateMinimum: return "Date of Birth has to be earlier than Date Blood Test"
        case .sbMinimum: return "SB value has to be a positive integer"
        }
    }
}
