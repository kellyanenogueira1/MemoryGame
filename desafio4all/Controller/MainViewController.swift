//
//  MainViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 12/12/20.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var buttonEasyLevel: UIButton!
    @IBOutlet weak var buttonMediumLevel: UIButton!
    @IBOutlet weak var buttonHardLevel: UIButton!
    @IBOutlet weak var buttonHistoric: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goEasyLevel(_ sender: Any) {
        showGame(rows: 4, columns: 3)
    }
    
    @IBAction func goMediumLevel(_ sender: Any) {
        showGame(rows: 4, columns: 4)
    }
    @IBAction func goHardLevel(_ sender: Any) {
        showGame(rows: 5, columns: 4)
    }
    
    @IBAction func goHistoric(_ sender: Any) {
    }
    
    func showGame(rows: Int, columns: Int) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let viewC = storyboard.instantiateViewController(identifier: "Game", creator: { coder in
            return GameViewController(coder: coder, rows: rows, collumns: columns)
        }) 
        navigationController?.pushViewController(viewC, animated: true)
    }
}
