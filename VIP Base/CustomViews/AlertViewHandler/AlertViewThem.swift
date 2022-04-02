//
//  AlertViewThem.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation


enum AllertThemes {
    case error
    case success
    case warning
    
    var localize: String {
        switch self {
        case .error:
            return Localization.string(for: .error)
        case .success:
            return Localization.string(for: .success)
        case .warning:
            return Localization.string(for: .warning)
        }
    }
    
}
