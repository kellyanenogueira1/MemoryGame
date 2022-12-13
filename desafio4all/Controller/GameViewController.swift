//
//  GameViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 11/12/20.
//

import UIKit
import CoreData
class GameViewController: UIViewController {
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonStart: UIButton!
    var context: NSManagedObjectContext!
    let board: Board
    let memoryGame = MemoryGame()
    var cards = [Card]()
    var chronometer: Chronometer?
    var level: Level!

    var titleView: UILabel = {
        let title: UILabel = UILabel()
        title.text = "Jogo da memória"
        title.textAlignment = .center
        title.textColor = .textColor
        title.font = .customFont(ofSize: 40)
        return title
    }()
 
    init? (coder: NSCoder, rows: Int, collumns: Int) {
        board = Board(rows: rows, columns: collumns)
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNewGame()
        memoryGame.delegate = self
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .greenBackGroundColor
        view.tintColor = .textColor
        collectionView.backgroundColor = .greenBackGroundColor
        
        labelTime.isHidden = true
        labelTime.textColor = .textColor
        labelTime.font = .customFont(ofSize: 30)
        
        buttonStart.tintColor = .textColor
        buttonStart.backgroundColor = .greenAction
        buttonStart.layer.shadowColor = UIColor.black.cgColor
        buttonStart.layer.shadowOffset = CGSize(width: 0, height: 3)
        buttonStart.layer.shadowRadius = 5
        buttonStart.layer.shadowOpacity = 0.3
        buttonStart.layer.cornerRadius = 8
        buttonStart.layer.masksToBounds = false
        buttonStart.setTitle("Jogar", for: .normal)
        buttonStart.titleLabel?.font = .customFont(ofSize: 30)
        
        navigationItem.titleView = titleView
    }
    
    func updateButton(_ isPlaying: Bool) {
        if isPlaying {
            buttonStart.backgroundColor = .yellowAction
            buttonStart.setTitle("Reiniciar", for: .normal)
        } else {
            buttonStart.backgroundColor = .greenAction
            buttonStart.setTitle("Jogar", for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if memoryGame.isPlaying {
            resetGame()
        }
    }
  
    
    @IBAction func startGame(_ sender: Any) {
        start()
    }
    
    func start() {
        labelTime.text = "00 : 00 : 00"
        labelTime.isHidden = false
        if let chronometer = chronometer {
            updateButton(false)
            collectionView.isUserInteractionEnabled = false
            chronometer.end()
            self.chronometer = nil
            resetGame()
        } else {
            updateButton(true)
            collectionView.isUserInteractionEnabled = true
            chronometer = Chronometer()
            chronometer?.delegate = self
        }
    }
    
    func setupCollectionView() {
        collectionView.isUserInteractionEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.allowsMultipleSelection = true
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)
    }
    
    func saveHistoric() {
        guard let timeString = labelTime.text else { return }
        HistoricService.shared.createNewHistoric(context: context, level: level.rawValue, timeString: timeString)
        HistoricService.shared.save(context: context)
    }
    
    func centerCollection() {
        collectionView.contentInset.top = max((collectionView.frame.height -  collectionView.contentSize.height) / CGFloat(board.rows), 0)
    }
    
    func setupNewGame() {
        collectionView.visibleCells.forEach { cell in
            guard let cell = cell as? GameCollectionViewCell else { return }
            cell.wrapperView.backgroundColor = .yellowAction
        }
        self.cards = memoryGame.newGame(totalCards: board.total)
        collectionView.reloadData()
    }
    
    func resetGame() {
        memoryGame.restartGame()
        setupNewGame()
    }
    
    func presentResult() {
        labelTime.isHidden = true
        guard let timeStr = labelTime.text else { return }
        let storyboard = UIStoryboard(name: "Alert", bundle: nil)
        guard let alertVC = storyboard.instantiateViewController(identifier: "alert") as? AlertViewController else { return }
        alertVC.labelTime = timeStr
        alertVC.delegate = self
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overFullScreen
        self.present(alertVC, animated: true)
    }
}
