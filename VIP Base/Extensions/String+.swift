//
//  String+.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import UIKit


extension String {
    
    var isInt: Bool {
        return Int(self) != nil
    }
    
    var int: Int? {
        return Int(self)
    }
    
    var trimmedString: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var replacedArabicDigitsWithEnglish: String {
        var string = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { string = string.replacingOccurrences(of: $0, with: $1) }
        return string
    }
    var replacedEnglishDigitsWithArabic: String {
        var string = self
        let map = ["0": "٠",
                   "1": "١",
                   "2": "٢",
                   "3": "٣",
                   "4": "٤",
                   "5": "٥",
                   "6": "٦",
                   "7": "٧",
                   "8": "٨",
                   "9": "٩"]
        map.forEach { string = string.replacingOccurrences(of: $0, with: $1) }
        return string
    }
  
    func getSizeWidth(size: CGFloat = 16) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: size)]
        let size = (self as NSString).size(withAttributes: fontAttributes as [NSAttributedString.Key: Any])
        return size
    }

}
extension String {
    func toDouble() -> Double {
        let price: Double = Double(self) ?? 0
        return price
    }
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
