//
//  TrendingRepositoryTableViewCell.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 23/06/2022.
//

import UIKit

final class TrendingRepositoryTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var ownerName: UILabel!
    @IBOutlet private weak var repositoryName: UILabel!
    @IBOutlet private weak var repositoryDescription: UILabel!
    @IBOutlet private weak var language: UILabel!
    @IBOutlet private weak var starCount: UILabel!
    @IBOutlet private weak var languageStackView: UIStackView!
    @IBOutlet private weak var starIcon: UIImageView!
    @IBOutlet private weak var languageDotView: UIView!
    
    var viewModel: TrendingRepositoryTableViewCellViewModelType?
    
    //MARK: - Properties
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    //MARK: - Configure
     
    func configure(viewModel: TrendingRepositoryTableViewCellViewModelType) {
        self.viewModel = viewModel
        setup()
        bind()
    }
    
    //MARK: - Render
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        languageDotView.layer.cornerRadius = languageDotView.bounds.height / 2
    }
}

//MARK: - Setup

extension TrendingRepositoryTableViewCell {
    
    func setup() {
        
        languageDotView.backgroundColor = .systemBlue
        starIcon.tintColor = .systemYellow
    }
}

//MARK: - Bind

extension TrendingRepositoryTableViewCell {
    
    func bind() {
        
        viewModel?.langugaeHide = { [weak self] isHide in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.languageStackView.isHidden = isHide
            }
        }
        
        loadImage()
        ownerName.text = viewModel?.getOwnerName()
        repositoryName.text = viewModel?.getRepositoryName()
        repositoryDescription.text = viewModel?.getRepositoryDescription()
        language.text = viewModel?.getLanguage()
        starCount.text = viewModel?.getStarCount()
    }

    func loadImage() {
        profileImage.loadImage(url: viewModel?.getProfileURL() ?? "")
    }
}



