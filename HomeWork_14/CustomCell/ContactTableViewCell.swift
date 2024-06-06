////
////  ContactTableViewCell.swift
////  HomeWork_14
////
////  Created by Андрей Выборнов on 20.05.2024.
////
//
//import UIKit
//
//class ContactTableViewCell: UITableViewCell {
//    
//    var name: UILabel
//    var surName: UILabel
//    
//    var numberImage: UIImageView
//    var emailImage: UIImageView
//    var countryImage: UIImageView
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        name = UILabel()
//        surName = UILabel()
//        
//        numberImage = UIImageView(image: UIImage(named: "phone.fill"))
//        emailImage = UIImageView(image: UIImage(named: "envelope.fill"))
//        countryImage = UIImageView(image: UIImage(named: "building.2.fill"))
//        
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        contentView.addSubview(name)
//        contentView.addSubview(surName)
//        contentView.addSubview(numberImage)
//        contentView.addSubview(emailImage)
//        contentView.addSubview(countryImage)
//        
//        labelSettings()
//        setupLabels()
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func labelSettings() {
//        name.font = Constants.Fonts.systemBoldFontForNAme
//        name.textColor = Constants.Color.blackColor
//    
//        surName.font = Constants.Fonts.systemFontsForSurName
//        surName.textColor = Constants.Color.blackColor
//        
//        
//        numberImage.tintColor = Constants.Color.blueColor
//        emailImage.tintColor = Constants.Color.blueColor
//        countryImage.tintColor = Constants.Color.blueColor
//        
//        
//    }
//    
//    func setupLabels() {
//
//        name.translatesAutoresizingMaskIntoConstraints = false
//        surName.translatesAutoresizingMaskIntoConstraints = false
//        numberImage.translatesAutoresizingMaskIntoConstraints = false
//        emailImage.translatesAutoresizingMaskIntoConstraints = false
//        countryImage.translatesAutoresizingMaskIntoConstraints = false
//        
//        name.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
//        
//        surName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        surName.leadingAnchor.constraint(equalTo: name.leadingAnchor, constant: 6).isActive = true
//        
//        numberImage.topAnchor.constraint(equalTo: name.topAnchor, constant: 8).isActive = true
//        numberImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
//        
//        emailImage.topAnchor.constraint(equalTo: name.topAnchor, constant: 8).isActive = true
//        emailImage.leadingAnchor.constraint(equalTo: numberImage.leadingAnchor, constant: 10).isActive = true
//        
//        countryImage.topAnchor.constraint(equalTo: surName.topAnchor, constant: 8).isActive = true
//        countryImage.leadingAnchor.constraint(equalTo: emailImage.leadingAnchor, constant: 10).isActive = true
//    }
//}
//
import UIKit

class ContactTableViewCell: UITableViewCell {
    
    private let name: UILabel
    private let surName: UILabel
    
    private let numberImage: UIImageView
    private let emailImage: UIImageView
    private let countryImage: UIImageView
    private let countrySmallImage: UIImageView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        name = UILabel()
        surName = UILabel()
        
        numberImage = UIImageView(image: UIImage(named: "phone.fill"))
        emailImage = UIImageView(image: UIImage(named: "envelope.fill"))
        countryImage = UIImageView(image: UIImage(named: "building.fill"))
        countrySmallImage = UIImageView(image: UIImage(named: "buildingSmall"))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(name)
        contentView.addSubview(surName)
        
        labelSettings()
        setupLabels()
        setupImageViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        [name, surName].forEach { $0.text = nil }
    }
    
    private func labelSettings() {
        name.font = Constants.Fonts.systemBoldFontForNAme
        name.textColor = Constants.Color.blackColor

        surName.font = Constants.Fonts.systemFontsForSurName
        surName.textColor = Constants.Color.blackColor
    }

    
    private func setupLabels() {
        name.translatesAutoresizingMaskIntoConstraints = false
        surName.translatesAutoresizingMaskIntoConstraints = false

        
        name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44).isActive = true
        
        surName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        surName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44).isActive = true
        surName.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 6).isActive = true
    }

    
    private func setupImageViews() {
        numberImage.tintColor = Constants.Color.blueColor
        emailImage.tintColor = Constants.Color.blueColor
        countryImage.tintColor = Constants.Color.blueColor
        countrySmallImage.tintColor = Constants.Color.blueColor

        contentView.addSubview(numberImage)
        contentView.addSubview(emailImage)
        contentView.addSubview(countryImage)
        contentView.addSubview(countrySmallImage)
        
        // Настройка ограничений для numberImage
        numberImage.translatesAutoresizingMaskIntoConstraints = false
        numberImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        numberImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        numberImage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
        numberImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true

        numberImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        // Настройка ограничений для emailImage
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        emailImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        emailImage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 11).isActive = true
        emailImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true

        emailImage.leadingAnchor.constraint(equalTo: numberImage.trailingAnchor, constant: 10).isActive = true
        
        // Настройка ограничений для countryImage
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
        countryImage.heightAnchor.constraint(equalToConstant: 19).isActive = true
        countryImage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 9).isActive = true
        countryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true

        countryImage.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 10).isActive = true
        
        // Настройка ограничений для countryImage
        countrySmallImage.translatesAutoresizingMaskIntoConstraints = false
        countrySmallImage.widthAnchor.constraint(equalToConstant: 7).isActive = true
        countrySmallImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
        countrySmallImage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12).isActive = true
        countrySmallImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true

        countrySmallImage.leadingAnchor.constraint(equalTo: countryImage.trailingAnchor, constant: 2).isActive = true
    }
    
    func configure(contact: UserInfo) {
        name.text = contact.name
        surName.text = contact.surname
        
        numberImage.isHidden = contact.phone == nil
        emailImage.isHidden = contact.email == nil
        countryImage.isHidden = contact.city == nil
        countrySmallImage.isHidden = contact.city == nil
    }
}
