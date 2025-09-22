//
//  1.2.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/23/24.
//

import Foundation

func level1_2(_ a:Int, _ b:Int) -> String {
    var day = b
    guard a != 1 else {
        switch day % 7 {
        case 0:
            return "THU"
        case 1:
            return "FRI"
        case 2:
            return "SAT"
        case 3:
            return "SUN"
        case 4:
            return "MON"
        case 5:
            return "TUE"
        case 6:
            return "WED"
        default:
            return "ERROR"
        }
    }
    for month in 1..<a {
        if month == 2 {
            day += 29
        } else if month < 8 {
            if month % 2 == 0 {
                day += 30
            } else {
                day += 31
            }
        } else {
            if month % 2 == 0 {
                day += 31
            } else {
                day += 30
            }
        }
    }
    switch day % 7 {
    case 0:
        return "THU"
    case 1:
        return "FRI"
    case 2:
        return "SAT"
    case 3:
        return "SUN"
    case 4:
        return "MON"
    case 5:
        return "TUE"
    case 6:
        return "WED"
    default:
        return "ERROR"
    }
}
