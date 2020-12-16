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
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
