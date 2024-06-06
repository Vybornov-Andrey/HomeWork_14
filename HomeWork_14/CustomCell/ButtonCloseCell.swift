//
//  ButtonCloseCell.swift
//  HomeWork_14
//
//  Created by Андрей Выборнов on 06.06.2024.
//

import UIKit

class ButtonCloseCell: UITableViewCell {
    
    private let buttonClose = UIButton()
    var closeButtonAction: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupButton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupButton() {
        contentView.addSubview(buttonClose)
        contentView.backgroundColor = Constants.Color.grayColor
        
        buttonClose.setTitle("Закрыть", for: .normal)
        buttonClose.titleLabel?.font = Constants.Fonts.systemBoldFontForTitle ?? UIFont.boldSystemFont(ofSize: 24)
        buttonClose.setTitleColor(Constants.Color.blueColor ?? UIColor.blue, for: .normal)

        buttonClose.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        closeButtonAction?()
    }
    
    private func setupConstraints() {
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        
        buttonClose.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        buttonClose.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        buttonClose.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -27).isActive = true

    }
    
    private func setupClickButton() {
        
    }
}
