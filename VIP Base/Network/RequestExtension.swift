//
//  RequestExtension.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation
import Alamofire

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("====================******************===================")
        debugPrint(self)
        debugPrint("====================******************===================")
        #endif
        return self
    }
}
