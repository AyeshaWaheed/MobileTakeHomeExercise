//
//  UINavigationControllerFactory.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 23/06/2022.
//

import UIKit

extension UINavigationController {
    
    static func withNavigationBar(rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        
        let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold)]
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.titleTextAttributes = textAttributes
            appearance.backgroundColor = .systemBackground
            appearance.shadowColor = .tertiaryLabel
            nav.navigationBar.scrollEdgeAppearance = appearance
        }
    
        nav.modalPresentationStyle = .fullScreen
        
        return nav
    }
    
}
