//
//  String+Extension.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 25/06/2022.
//

import Foundation
import UIKit

extension String {
    
    func attributedForm(str: String, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: str, attributes: [
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ])
        attributedString.addAttributes([
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.systemGray
        ], range: range)
        return attributedString
    }
}
