//
//  BaseCodable.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation

protocol BaseCodable: Codable {
    var isSuccess: Bool { get }
    var status: Bool { get }
    var msg: String? { get }
}

extension BaseCodable {
    var isSuccess: Bool {
        return status == true
    }
}

struct BaseModelData<T: Codable>: BaseCodable {
    var status: Bool
    var msg: String?
    var data: T?
}

struct BaseModel: BaseCodable {
    var status: Bool
    var msg: String?
}


