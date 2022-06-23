//
//  UIImageView+Extension.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 23/06/2022.
//

import UIKit

extension UIImageView {
    
    func loadImage(url: String) {
        guard let url = URL(string: url) else { return }
        ImageLoadAdapter().loadImage(url: url, imageView: self)
    }
    
}
