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
    
    let titleView: UILabel = {
        let title = UILabel()
        title.text = "Jogo da Memória"
        title.textColor = .textColor
        title.font = UIFont.systemFont(ofSize: 45)
        return title
    }()
    
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
    
    func configureUI() {
        view.tintColor = .textColor
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .magentaBackGround
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = titleView
       
        view.backgroundColor = .magentaBackGround
        
        buttonEasyLevel.titleLabel?.text = "4X3"
        layout(view: buttonEasyLevel)
        
        buttonMediumLevel.titleLabel?.text = "4X4"
        layout(view: buttonMediumLevel)
        
        buttonHardLevel.titleLabel?.text = "5X4"
        layout(view: buttonHardLevel)
        
        buttonHistoric.titleLabel?.text = "Histórico"
        layout(view: buttonHistoric)
        
    }
    
    func layout(view: UIView) {
        view.backgroundColor = .greenAction
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
    }
    
    func showGame(rows: Int, columns: Int) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let viewC = storyboard.instantiateViewController(identifier: "Game", creator: { coder in
            return GameViewController(coder: coder, rows: rows, collumns: columns)
        }) 
        navigationController?.pushViewController(viewC, animated: true)
    }
}
