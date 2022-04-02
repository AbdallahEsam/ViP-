//
//  NetworkSpy.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
@testable import VIP_Base

class NetworkSpy: NetworkProtocol {

    var isRequestSent = false
    var isUploadSent = false
    var isCancelAllRequest = false

    func request<T>(_ request: URLRequestConvertible, decodeTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T : BaseCodable {
        isRequestSent = true
    }
    
    func upload<T>(_ request: URLRequestConvertible, data: [UploadData], decodedTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T : BaseCodable {
        isUploadSent = true
    }
    
    func cancelAllRequests() {
        isCancelAllRequest = true
    }
    

}
