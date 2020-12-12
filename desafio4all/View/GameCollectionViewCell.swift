//
//  GameCollectionViewCell.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 12/12/20.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GameCollectionViewCell"
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
        setImageBackgound(name: "1")
        addBackgroundImage()
        addWrapperView()
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageBackgound(name: String) {
        backgroundImage.image = UIImage(named: name)
    }

    func addBackgroundImage() {
        self.contentView.addSubview(backgroundImage)
        setupConstraints(view: backgroundImage)
    }
    
    func addWrapperView() {
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
}
