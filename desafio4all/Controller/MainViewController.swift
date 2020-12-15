//
//  MainViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 12/12/20.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonEasyLevel: UIButton!
    @IBOutlet weak var buttonMediumLevel: UIButton!
    @IBOutlet weak var buttonHardLevel: UIButton!
    @IBOutlet weak var buttonHistoric: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
    
    private func configureUI() {
        view.tintColor = .textColor
        view.backgroundColor = .magentaBackGround
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .magentaBackGround
        navigationController?.navigationBar.isTranslucent = false
        
        buttonEasyLevel.titleLabel?.text = "4X3"
        layout(view: buttonEasyLevel)
        buttonEasyLevel.backgroundColor = .greenAction
        buttonEasyLevel.titleLabel?.font = .customFont(ofSize: 48)
        
        buttonMediumLevel.titleLabel?.text = "4X4"
        layout(view: buttonMediumLevel)
        buttonMediumLevel.backgroundColor = .greenAction
        buttonMediumLevel.titleLabel?.font = .customFont(ofSize: 48)
        
        buttonHardLevel.titleLabel?.text = "5X4"
        layout(view: buttonHardLevel)
        buttonHardLevel.backgroundColor = .greenAction
        buttonHardLevel.titleLabel?.font = .customFont(ofSize: 48)
        
        buttonHistoric.titleLabel?.text = "Histórico"
        layout(view: buttonHistoric)
        buttonHistoric.backgroundColor = .yellowAction
        buttonHistoric.titleLabel?.font = .customFont(ofSize: 48)
     
        titleLabel.text = "Jogo da Memória"
        titleLabel.textColor = .textColor
        titleLabel.font = .customFont(ofSize: 48)
        titleLabel.textAlignment = .center
    }
    
    private func layout(view: UIView) {
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 50, height: 50)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 17
    }
    
    private func showGame(rows: Int, columns: Int) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let viewC = storyboard.instantiateViewController(identifier: "Game", creator: { coder in
            return GameViewController(coder: coder, rows: rows, collumns: columns)
        }) 
        navigationController?.pushViewController(viewC, animated: true)
    }
}
