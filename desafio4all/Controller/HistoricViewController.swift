//
//  HistoricViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import UIKit

class HistoricViewController: UIViewController {

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
        configureUI()
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
    
    
    func configureUI() {
        view.tintColor = .yellowAction
        view.backgroundColor = .magentaBackGround
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .magentaBackGround
    }
    
    func viewForHeader() -> UIView {
        let view = UIView()
        view.backgroundColor = .magentaBackGround
        
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
