//
//  DateExtension.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 17/12/20.
//

import Foundation
extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}

