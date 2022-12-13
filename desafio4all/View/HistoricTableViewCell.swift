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
        contentView.backgroundColor = .greenBackGroundColor
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
        labelDate.text = historic.date?.toString()
        switch historic.level {
        case 1:
            labelLevel.text = "4x3"
        case 2:
            labelLevel.text = "4x4"
        case 3:
            labelLevel.text = "5x4"
        default:
            labelLevel.text = ""
        }
        labelTime.text = historic.time
    }
}
