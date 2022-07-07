//
//  RepositoryDescriptionViewController.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 06/07/2022.
//

import UIKit

class RepositoryDescriptionViewController: UIViewController {
    
    //MARK: - Properties
    
    private(set) var viewModel: RepositoryDescriptionViewModelType!

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

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = viewModel.getRepositoryDescription()
    }

}
