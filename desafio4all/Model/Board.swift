//
//  Board.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 13/12/20.
//

import Foundation
struct Board {
    let rows: Int
    let columns: Int
    var total: Int {
        get {
            return rows * columns
        }
    }
}
