//
//  MainViewController.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

enum OTPFieldType: CaseIterable {
    case `default`
    case round
    case custom

    var title: String {
        switch self {
        case .default:
            return "Default input field"
        case .round:
            return "Round input field"
        case .custom:
            return "Custom input field"
        }
    }
}

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
        configureTableView()
        fillTable()
    }

}

// MARK: - Configuration

private extension MainViewController {

    func configureTableView() {
        tableView.alwaysBounceVertical = true
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }

    func fillTable() {
        adapter.clearCellGenerators()
        OTPFieldType.allCases.forEach { type in
            let gen = BaseCellGenerator<MainFeedCell>(with: type.title)
            gen.didSelectEvent += {
                print(type)
            }
            adapter.addCellGenerator(gen)
        }
        adapter.forceRefill()
    }

}
