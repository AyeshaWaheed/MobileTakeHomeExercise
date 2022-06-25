//
//  TrendingRepositoriesViewController.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 23/06/2022.
//

import UIKit

final class TrendingRepositoriesViewController: BaseViewController {

    // MARK: - Properties

    private var viewModel: TrendingRepositoriesViewModelType!
    private let refreshControl = UIRefreshControl()

    // MARK: - Init

    init(viewModel: TrendingRepositoriesViewModelType) {
        super.init(nibName: "BaseViewController", bundle: Bundle.main)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewModel.getNavTitle()
        configureTableView()
        setup()
        bind()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getTrendingRepositories()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] context in
            guard let self = self else { return }
            if let stackBounds = self.loadingErrorView?.stackView.bounds {
                self.loadingErrorView?.lottieAnimationView?.frame = stackBounds
            }
        }, completion: nil)
    }

    //MARK: - Configure
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.prefetchDataSource = self
    }
    
    //MARK: - Action Method
    
    @objc func refresh(_ sender: AnyObject) {
        tableView.showAnimatedGradientSkeleton()
        viewModel.getTrendingRepositories()
    }
}

//MARK:- Setup

private extension TrendingRepositoriesViewController {
    
    func setup() {
        registerCell()
        setRefreshControll()
        
        if let errorView = self.loadingErrorView {
            self.view.addSubview(errorView)
            errorView.bind()
            errorView.showAnimation()
            errorView.isHidden = true
        }
    }

    func registerCell() {
        let nib = UINib(nibName: "TrendingRepositoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TrendingRepositoryTableViewCell")
    }
    
    func setRefreshControll() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = .clear
        tableView.addSubview(refreshControl)
    }
}

//MARK:- Bind

private extension TrendingRepositoriesViewController {
    
    func bind() {
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.stopShimmering()
            }
        }
        
        viewModel.loadingErrorView = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.loadingErrorView()
            }
        }
    }
    
    func stopShimmering() {
        tableView.stopSkeletonAnimation()
        tableView.hideSkeleton()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func loadingErrorView() {
        stopShimmering()
        loadingErrorView?.isHidden = false
        
        loadingErrorView?.retryAction = { [weak self] in
            guard let self = self else { return }
            self.loadingErrorView?.isHidden = true
            self.tableView.showAnimatedGradientSkeleton()
            self.viewModel.getTrendingRepositories()
        }
    }
}


//MARK: - TableView delegate and dataSource

extension TrendingRepositoriesViewController: UITableViewDelegate, UITableViewDataSourcePrefetching {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.setNumberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel.cellForRowAtIndexPath(indexPath: indexPath) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingRepositoryTableViewCell", for: indexPath) as? TrendingRepositoryTableViewCell else { return UITableViewCell() }
        cell.layoutIfNeeded()
        cell.configure(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        viewModel.prefetchImages()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TrendingRepositoryTableViewCell {
            cell.loadImage()
        }
    }
}


