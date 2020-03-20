//
//  MainViewController.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class MainViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: MainViewOutput?

    // MARK: - Private Properties

    private lazy var adapter = BaseTableDataDisplayManager(collection: tableView)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureTableView()
        fillTable()
    }

}

// MARK: - Configuration

private extension MainViewController {

    func configureNavigationBar() {
        title = L10n.Main.title
        navigationController?.navigationBar.applyWhiteStyle()
    }

    func configureTableView() {
        tableView.alwaysBounceVertical = true
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }

    func fillTable() {
        adapter.clearCellGenerators()
        OTPFieldType.allCases.forEach { type in
            let gen = BaseCellGenerator<MainFeedCell>(with: type.title)
            gen.didSelectEvent += { [weak self] in
                self?.output?.openOTP(with: type)
            }
            adapter.addCellGenerator(gen)
        }
        adapter.forceRefill()
    }

}
