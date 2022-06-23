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
    @IBOutlet private weak var languageColorView: UIView!
    
    private var viewModel: TrendingRepositoryTableViewCellViewModelType?
    
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
        bind()
    }
    
    //MARK: - Render
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        languageColorView.layer.cornerRadius = languageColorView.bounds.height / 2
    }
}

//MARK: - Bind

extension TrendingRepositoryTableViewCell {
    
    func bind() {
        
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



