//
//  UIView+Extension.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 24/06/2022.
//

import UIKit
import Lottie

extension UIView {
    
    func animation(fileName: String, speed: CGFloat = 3, view: UIView) -> UIView {
        
        let animationView = AnimationView(name: fileName)
        animationView.frame = view.frame
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = speed
        animationView.loopMode = .loop
        addSubview(animationView)
        animationView.play()
        return animationView
    }
}
