//
//  HistoricTableViewCell.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import UIKit

class HistoricTableViewCell: UITableViewCell {
    static let reuseIdentifier = "HistoricTableViewCell"
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelLevel: UILabel!
    @IBOutlet weak var labelHour: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override func layoutSubviews() {
        contentView.backgroundColor = .magentaBackGround
        labelDate.text = "20/08/2020"
        configureLabel(label: labelDate)
        
        labelLevel.text = "4X4"
        configureLabel(label: labelLevel)
        
        labelHour.text = "00 : 00 : 00"
        configureLabel(label: labelHour)
    }
    
    func configureLabel(label: UILabel) {
        label.textColor = .textColor
        label.textAlignment = .center
        label.font = .customFont(ofSize: 30)
    }
}
