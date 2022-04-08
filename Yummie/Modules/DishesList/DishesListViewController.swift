//
//  DishesList module - DishesListViewController.swift
//  Yummie
//
//  Created by sakhnenkoff on 07/04/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

class DishesListViewController: UIViewController {

    public var viewModel: DishesListViewModel!
    
    @IBOutlet
    weak var tableView: UITableView! {
        didSet {
            tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: DishListTableViewCell.identifier)
        }
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupBindings()
    }
    
    //MARK: - Configuration
    
    private func configure() {
        title = viewModel.title
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }

    private func setupBindings() {
        
    }

}

extension DishesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.configure(with: viewModel.dishCategory, dish: viewModel.dishes[indexPath.row])
        return cell
    }
    
}
