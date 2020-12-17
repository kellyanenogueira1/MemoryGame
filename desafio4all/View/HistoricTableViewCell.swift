//
//  HistoricTableViewCell.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import UIKit
import CoreData
class HistoricTableViewCell: UITableViewCell {
    static let reuseIdentifier = "HistoricTableViewCell"
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelLevel: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override func layoutSubviews() {
        contentView.backgroundColor = .magentaBackGround
        configureLabel(label: labelDate)
        configureLabel(label: labelLevel)
        configureLabel(label: labelTime)
    }
    
    func configureLabel(label: UILabel) {
        label.textColor = .textColor
        label.textAlignment = .center
        label.font = .customFont(ofSize: 30)
    }
    
    func configureCell(historic: Historic) {
        labelDate.text = historic.date
        labelLevel.text = historic.level
        labelTime.text = historic.time
    }
}
