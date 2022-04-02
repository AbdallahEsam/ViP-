//
//  MainButton.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import UIKit
class MainButton: UIButton {

    var fontSize:CGFloat = 16
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeitDisaple()
        layer.cornerRadius = 23
        titleLabel?.font = .systemFont(ofSize: fontSize)
    }

    func makeitDisaple() {
        isEnabled = false
        layer.borderWidth = 0
        isUserInteractionEnabled = false
        tintColor = .buttonTextColorDisable
        setTitleColor(.buttonTextColorDisable, for: .normal)
        backgroundColor = .disableButtonColor
    }

    func makeItEnable() {
        isEnabled = true
        layer.borderWidth = 0
        isUserInteractionEnabled = true
        tintColor = .enableButtonTextColor
        setTitleColor(.enableButtonTextColor, for: .normal)
        backgroundColor = .mainColor
    }
}
