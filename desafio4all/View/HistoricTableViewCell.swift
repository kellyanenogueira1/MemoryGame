//
//  HistoricTableViewCell.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import UIKit

class HistoricTableViewCell: UITableViewCell {
    static let reuseIdentifier = "HistoricTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override func layoutSubviews() {
        contentView.backgroundColor = .magentaBackGround
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
