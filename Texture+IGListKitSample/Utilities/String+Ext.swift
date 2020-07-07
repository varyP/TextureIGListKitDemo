//
//  String+Ext.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import UIKit

extension String {
    func attributed(font: UIFont?, size: CGFloat? = nil, color: UIColor = .black, alignment: NSTextAlignment = .left) -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        let attr = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: size ?? UIFont.systemFontSize), // failsafe unwrap defaults to system font
            NSAttributedString.Key.paragraphStyle: paragraph
        ]
        return NSAttributedString(string: self, attributes: attr)
    }
}
