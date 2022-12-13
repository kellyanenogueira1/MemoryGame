//
//  HistoricViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import UIKit
import CoreData
class HistoricViewController: UIViewController {
    var context: NSManagedObjectContext!
    var historic: [Historic] = [] {
        didSet {
            // sort from most recent game
            historic.reverse()
            checkTable()
            tableView.reloadData()
        }
    }
    var alertLabel: UILabel = {
        var label = UILabel()
        label.text = "Você ainda não tem partidas registradas"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .yellowAction
        label.font = .customFont(ofSize: 30)
        return label
    }()
    
    @IBOutlet weak var tableView: UITableView!
    var tileLabel: UILabel = {
        let label = UILabel()
        label.text = "Histórico"
        label.textColor = .textColor
        label.textAlignment = .center
        label.font = .customFont(ofSize: 40)
        return label
    }()
    
    lazy var buttonDismiss: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(goBakc), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addAlertLabel()
        configureUI()
        fetchData()
    }
    
    func checkTable() {
        alertLabel.isHidden = !historic.isEmpty
    }
    
    func fetchData() {
        historic = HistoricService.shared.fetch(context: context, predicate: NSPredicate(value: true))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func goBakc() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
    }
    
    func addAlertLabel() {
        tableView.addSubview(alertLabel)
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
        alertLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        alertLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 20).isActive = true
        alertLabel.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 20).isActive = true
    }
    func configureUI() {
        view.tintColor = .yellowAction
        view.backgroundColor = .greenBackGroundColor
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .greenBackGroundColor
    }
    
    func viewForHeader() -> UIView {
        let view = UIView()
        view.backgroundColor = .greenBackGroundColor
        
        view.addSubview(tileLabel)
        tileLabel.translatesAutoresizingMaskIntoConstraints = false
        tileLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(buttonDismiss)
        buttonDismiss.translatesAutoresizingMaskIntoConstraints = false
        buttonDismiss.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonDismiss.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buttonDismiss.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonDismiss.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return view
    }
}
