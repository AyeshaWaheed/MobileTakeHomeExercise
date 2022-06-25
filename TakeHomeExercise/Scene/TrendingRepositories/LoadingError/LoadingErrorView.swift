//
//  LoadingErrorView.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 24/06/2022.
//

import UIKit

final class LoadingErrorView: UIView {
    
    //MARK: - Properties
    
    @IBOutlet private weak var animationView: UIView!
    @IBOutlet private weak var errorDescription: UILabel!
    @IBOutlet private weak var retryButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var lottieAnimationView: UIView?
    var retryAction: (()->())?
    
    //MARK: - Initialize
    
    class func instanceFromNib() -> LoadingErrorView? {
        UINib(nibName: "LoadingErrorView", bundle: nil).instantiate(withOwner: self, options: nil).first as? LoadingErrorView
    }
    
    //MARK: - Render
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        retryButton.layer.borderColor = UIColor.systemGreen.cgColor
        retryButton.layer.borderWidth = 1
        retryButton.layer.cornerRadius = 5
    }
}

//MARK: - Action Method

private extension LoadingErrorView {
    
    @IBAction func retryAction(_ sender: UIButton) {
        retryAction?()
    }
}

//MARK: - Animation

extension LoadingErrorView {
    
    func showAnimation() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.lottieAnimationView = self.animationView.animation(fileName: "4506-retry-and-user-busy-version-2", view: self.animationView)
        }
    }
}

//MARK: - Bind

extension LoadingErrorView {
    
    func bind() {
        
        let desc = LoadingErrorViewStrings.errorDescription
        errorDescription.attributedText = desc.attributedForm(str: desc, range: NSRange(location: 23, length: 42))
    }
}

//MARK: - Strings

extension LoadingErrorView {
    
    private enum LoadingErrorViewStrings {
        static var errorDescription = "Something went wrong...\nAn alien is probably blocking your signal"
    }
}
