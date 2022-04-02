//
//  HandleResponseError.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit

protocol AlertHandlerViewProtocol {
    func showAlert(with message: String, title: AllertThemes)
}

extension AlertHandlerViewProtocol where Self: UIViewController {
    func showAlert(with message: String, title: AllertThemes) {
        AlertViewHandler().showAlert(message: message, title: title)
    }
}

