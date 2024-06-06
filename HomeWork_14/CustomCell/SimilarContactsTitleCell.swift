//
//  SimilarContactsCell.swift
//  HomeWork_14
//
//  Created by Андрей Выборнов on 05.06.2024.


import UIKit
class SimilarContactsTitleCell: UITableViewCell {
    
    private let similarDataView = UIView()
    private let similarTitle = UILabel()
    
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
    
    private func setupSimilarViews() {
        contentView.addSubview(similarDataView)
        similarDataView.backgroundColor = Constants.Color.grayColor
        
        similarTitle.text = "Похожие контакты"
        similarTitle.textColor = Constants.Color.grayColorHeader
        similarTitle.font = .boldSystemFont(ofSize: 15)
        similarTitle.translatesAutoresizingMaskIntoConstraints = false
        similarTitle.textAlignment = .left
        
        similarDataView.addSubview(similarTitle)
    }
    
    private func setupConstraints() {
        similarDataView.translatesAutoresizingMaskIntoConstraints = false
        
        similarDataView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        similarDataView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        similarDataView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        similarDataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        similarTitle.translatesAutoresizingMaskIntoConstraints = false
        similarTitle.topAnchor.constraint(equalTo: similarDataView.topAnchor, constant: 27).isActive = true
        similarTitle.bottomAnchor.constraint(equalTo: similarDataView.bottomAnchor, constant: -11).isActive = true
        similarTitle.leadingAnchor.constraint(equalTo: similarDataView.leadingAnchor, constant: 9).isActive = true
    }
}
