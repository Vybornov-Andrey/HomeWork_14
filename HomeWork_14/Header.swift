//
//  Header.swift
//  HomeWork_14
//
//  Created by Андрей Выборнов on 23.05.2024.
//

import UIKit

class Header: UIViewController {
    
    func madeTitle(labelText: String, textColor: UIColor, textFont: UIFont) -> UILabel {
        let title = UILabel()
        title.text = labelText
        title.textColor = textColor
        title.font = textFont
        
        return title
    }
}
