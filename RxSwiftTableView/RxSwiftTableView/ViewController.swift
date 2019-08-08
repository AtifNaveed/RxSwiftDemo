//
//  ViewController.swift
//  RxSwiftTableView
//
//  Created by Atif on 07/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private var addButton: UIBarButtonItem! = nil
    @IBOutlet weak var tableView: UITableView!

    private var viewModel: TableViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupTableViewBinding()
    }

    private func setupUI() {
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    private func setupViewModel() {
        self.viewModel = TableViewModel(addItemTap: addButton.rx.tap.asDriver())
    }
    
    private func setupTableViewBinding() {
        viewModel.dataSource.bind(to: tableView.rx.items(cellIdentifier: String(describing: TableViewCell.self), cellType: UITableViewCell.self)) { row, element, cell in
            cell.textLabel?.text = "\(element)# \(row)"
        }.disposed(by: disposeBag)
    }
}

