//
//  GameCollectionViewCell.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 12/12/20.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GameCollectionViewCell"
    var card: Card?
    var isShown: Bool {
        get {
            return self.card!.isShown
        }
    }
    
    var backgroundImage: UIImageView = {
        let backImage = UIImageView()
        backImage.contentMode = .scaleAspectFill
        backImage.layer.cornerRadius = 8
        backImage.layer.masksToBounds = true
        return backImage
    }()
   
    var wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    override func layoutSubviews() {
        addBackgroundImage()
        addWrapperView()
        addShadow()
    }

    func addShadow() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOpacity = 0.3
    }
    override init (frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCard(_ card: Card) {
        self.card = card
        card.delegate = self
    }
   
    func setImageBackgound(name: String) {
        backgroundImage.image = UIImage(named: name)
    }

    func addBackgroundImage() {
        self.contentView.addSubview(backgroundImage)
        setupConstraints(view: backgroundImage)
    }
    
    func addWrapperView() {
        wrapperView.backgroundColor = .blue
        self.contentView.addSubview(wrapperView)
        setupConstraints(view: wrapperView)
    }
    
    func setupConstraints(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func flip() {
        UIView.transition(from: wrapperView,
                          to: backgroundImage,
                          duration: 0.3,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: nil)
    }
    
    func flipBack() {
        UIView.transition(from: backgroundImage,
                          to: wrapperView,
                          duration: 0.3,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }
}

extension GameCollectionViewCell: GameCellDelegate {
    func success() {
        wrapperView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.wrapperView.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 0.5)
        })
    }
    
    func animateCard(_ animate: Bool) {
        if animate {
            flip()
        } else {
            flipBack()
        }
    }
}
