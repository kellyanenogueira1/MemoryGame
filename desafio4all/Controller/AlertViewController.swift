//
//  AlertViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 16/12/20.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var leaveButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    weak var delegate: MemoryGameDelegate?
    var labelTime = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction func playAgain(_ sender: Any) {
        delegate?.playAgain()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func leaveGame(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureUI(){
        congratsLabel.font = .customFont(ofSize: 50)
        congratsLabel.textColor = .magentaBackGround
        
        messageLabel.font = .customFont(ofSize: 24)
        messageLabel.textColor = .magentaBackGround
        
        timeLabel.font = .customFont(ofSize: 24)
        timeLabel.textColor = .magentaBackGround
        timeLabel.text = labelTime

        alertView.backgroundColor = .yellowAction
        layout(alertView)
        
        playButton.tintColor = .textColor
        playButton.backgroundColor = .greenAction
        playButton.setTitle("Jogar", for: .normal)
        playButton.titleLabel?.font = .customFont(ofSize: 30)
        layout(playButton)
        
        leaveButton.tintColor = .textColor
        leaveButton.backgroundColor = .customGray
        leaveButton.setTitle("Sair", for: .normal)
        leaveButton.titleLabel?.font = .customFont(ofSize: 30)
        layout(leaveButton)
    }
    
    func layout(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = false
    }

}
