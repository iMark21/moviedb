//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MovieDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieDetailViewModelProtocol?
    
    private let loadingViewController = LoadingViewController()
    private let errorViewController = ErrorViewController()
    private let disposeBag = DisposeBag()
    
    // MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAccesibilityIdentifiers()
        configureView()
        setupViewModel()
        loadData()
    }
    
    // MARK: - View methods
    
    private func configureView() {
        title = NSLocalizedString("_title_detail", comment: "")
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: LayoutConstants.Cell.MovieDetailCell,
                                 bundle: nil),forCellReuseIdentifier: LayoutConstants.Cell.MovieDetailCell)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Accesibility test
    
    private func configureAccesibilityIdentifiers(){
        view.accessibilityIdentifier = AccessibilityIdentifiers.views.list
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.elements.detailTableView
    }
    
    // MARK: - ViewModel methods
    
    private func setupViewModel(){
        guard let viewModel = viewModel else {return}
        
        let state = viewModel.state.asObservable()
        state.subscribe(onNext: { (state) in
            switch state{
            case .loading:
                self.errorViewController.remove()
                self.add(child: self.loadingViewController)
            case .loaded(let cellViewModels):
                self.bindData(data: cellViewModels)
                self.errorViewController.remove()
                self.loadingViewController.remove()
            case .empty:
                break
            case .error:
                self.loadingViewController.remove()
                self.add(child: self.errorViewController)
            }
        }).disposed(by: disposeBag)
    }
    
    private func loadData(){
        guard let viewModel = viewModel else {
            return
        }
        viewModel.requestData(scheduler: MainScheduler.asyncInstance)
    }
    
    private func bindData(data: Observable<[MovieDetailViewModelCellProtocol]>) {
        data.asObservable()
            .bind(to: tableView
                .rx
                .items(cellIdentifier: LayoutConstants.Cell.MovieDetailCell,
                       cellType: MovieDetailCell.self)) { (row, element, cell) in
                        cell.setup(viewModel: element)
        }.disposed(by: disposeBag)
    }
    
}
