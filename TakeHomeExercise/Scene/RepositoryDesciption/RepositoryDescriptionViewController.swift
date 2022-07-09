//
//  RepositoryDescriptionViewController.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 06/07/2022.
//

import UIKit

final  class RepositoryDescriptionViewController: UIViewController {
    
    //MARK: - Properties
    
    private(set) var viewModel: RepositoryDescriptionViewModelType!
    @IBOutlet private weak var repositoryDescription: UILabel!
    
    //MARK: - Init
    
    init(viewModel: RepositoryDescriptionViewModelType) {
        super.init(nibName: "RepositoryDescriptionViewController", bundle: Bundle.main)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
}

//MARK: - Bind

extension RepositoryDescriptionViewController {
    func bind() {}
}
