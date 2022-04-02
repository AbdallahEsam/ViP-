//
//  LoaderExtentions.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import UIKit
import Foundation

extension UIButton {
    
    func showLoading(lock: Bool = true) {
        let loader = LoadingView.shared
        self.addSubview(loader)
        self.bringSubviewToFront(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        loader.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        loader.activityIndicator.startAnimating()
        if lock {
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }

    func stopLoading(){
        let loader = LoadingView.shared
        loader.removeFromSuperview()
        isEnabled = true
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
}


