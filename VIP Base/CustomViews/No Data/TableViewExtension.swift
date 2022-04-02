//
//  TableViewExtension.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {
    
    func setEmptyData(image:UIImage,description:String ,title:String,delegate:NoDataViewControllerDelegate?, buttonText:String? = nil ) {
        let vc = NoDataViewController(frame: .zero)
        vc.setData(image: image, description: description, title: title, delegate: delegate, buttonText: buttonText)
        backgroundView = vc
    }
    
   
    func removeBackGroundView(){
        backgroundView = nil
    }
}

extension UICollectionView {
    func setEmptyData(image:UIImage,description:String ,title:String ,delegate:NoDataViewControllerDelegate?,buttonText:String? = nil ) {
        let vc = NoDataViewController(frame: .zero)
        vc.setData(image: image, description: description, title: title, delegate: delegate, buttonText: buttonText)
        backgroundView = vc
    }
    
   
    func removeBackGroundView(){
        backgroundView = nil
    }
}
