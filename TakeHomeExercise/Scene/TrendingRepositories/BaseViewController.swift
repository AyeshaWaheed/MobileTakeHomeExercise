//
//  TrendingRepositoriesViewController.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 22/06/2022.
//

import UIKit
import SkeletonView

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    lazy var loadingErrorView = LoadingErrorView.instanceFromNib()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        configureTableViewDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.showAnimatedGradientSkeleton()
    }
    
    // MARK: - Configure
    
    func configureTableViewDataSource() {
        tableView.dataSource = self
    }
}


extension BaseViewController: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "TrendingRepositoryTableViewCell"
    }
}


