//
//  Int+Ext.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import Foundation

extension Int {
    
    func findGender() -> String {
        switch self {
        case 1 : "Female"
        case 2 : "Male"
        case 3 : "Non-binary"
        default : "Not Set / Not Specified"
        }
    }
}
