//
//  SimilarContactsDetailsCell.swift
//  HomeWork_14
//
//  Created by Андрей Выборнов on 05.06.2024.
//

import UIKit

class SimilarContactsDetailsCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()
    
    var selectedContact: UserInfo?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSimilarViews()
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
    
    func configures(contact: UserInfo) {
        nameLabel.text = "\(contact.name) \(contact.surname ?? "")"
        phoneLabel.text = contact.phone
    }
}

private extension SimilarContactsDetailsCell {
    func setupSimilarViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        phoneLabel.font = UIFont.systemFont(ofSize: 14)
        
        nameLabel.textColor = UIColor.black
        phoneLabel.textColor = UIColor.darkGray
    }
    
    func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
          
        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        phoneLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
}
