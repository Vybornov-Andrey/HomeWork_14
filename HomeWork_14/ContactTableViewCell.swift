//
//  ContactTableViewCell.swift
//  HomeWork_14
//
//  Created by Андрей Выборнов on 20.05.2024.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    var name: UILabel
    var surName: UILabel
    
    var numberImage: UIImageView
    var emailImage: UIImageView
    var countryImage: UIImageView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        name = UILabel()
        surName = UILabel()
        
        numberImage = UIImageView(image: UIImage(named: "phone.fill"))
        emailImage = UIImageView(image: UIImage(named: "envelope.fill"))
        countryImage = UIImageView(image: UIImage(named: "building.2.fill"))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(name)
        contentView.addSubview(surName)
        contentView.addSubview(numberImage)
        contentView.addSubview(emailImage)
        contentView.addSubview(countryImage)
        
        labelSettings()
        setupLabels()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func labelSettings() {
        name.font = Constants.Fonts.systemBoldFontForNAme
        name.textColor = Constants.Color.blackColor
    
        surName.font = Constants.Fonts.systemFontsForSurName
        surName.textColor = Constants.Color.blackColor
        
        
        numberImage.tintColor = Constants.Color.blueColor
        emailImage.tintColor = Constants.Color.blueColor
        countryImage.tintColor = Constants.Color.blueColor
        
        
    }
    
    func setupLabels() {

        name.translatesAutoresizingMaskIntoConstraints = false
        surName.translatesAutoresizingMaskIntoConstraints = false
        numberImage.translatesAutoresizingMaskIntoConstraints = false
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        
        name.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        surName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        surName.leadingAnchor.constraint(equalTo: name.leadingAnchor, constant: 6).isActive = true
        
        numberImage.topAnchor.constraint(equalTo: name.topAnchor, constant: 8).isActive = true
        numberImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        emailImage.topAnchor.constraint(equalTo: name.topAnchor, constant: 8).isActive = true
        emailImage.leadingAnchor.constraint(equalTo: numberImage.leadingAnchor, constant: 10).isActive = true
        
        countryImage.topAnchor.constraint(equalTo: surName.topAnchor, constant: 8).isActive = true
        countryImage.leadingAnchor.constraint(equalTo: emailImage.leadingAnchor, constant: 10).isActive = true
    }
}
