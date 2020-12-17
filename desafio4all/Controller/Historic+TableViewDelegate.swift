//
//  Historic+TableViewDelegate.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import Foundation
import UIKit
extension HistoricViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoricTableViewCell.reuseIdentifier) as? HistoricTableViewCell else { return UITableViewCell() }
        cell.configureCell(historic: historic[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       viewForHeader()
    }
    
}
