//
//  HistoricViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import UIKit

class HistoricViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoricTableViewCell.self, forCellReuseIdentifier: HistoricTableViewCell.reuseIdentifier)
    }

}
