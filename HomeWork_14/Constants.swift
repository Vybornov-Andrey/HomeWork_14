//
//  Constants.swift
//  HomeWork_14
//
//  Created by Андрей Выборнов on 21.05.2024.
//
import UIKit

enum Constants {
    enum Fonts {
        static var systemFontsForSurName: UIFont? {
            UIFont(name: "System Font", size: 17)
        }    
        
        static var systemBoldFontForNAme: UIFont? {
            UIFont.boldSystemFont(ofSize: 20)
        }
        
        static var systemBoldFontForTitle: UIFont? {
            UIFont.boldSystemFont(ofSize: 24)
        }
    }
    
    enum Color {
        static var blackColor: UIColor? {
            UIColor(named: "ColorText")
        }
        
        static var blueColor: UIColor? {
            UIColor(named: "ColorIcon")
        }
        
        static var grayColor: UIColor? {
            UIColor(named: "ColorFon")
        }
    }
    
    enum Image {
        static var profile = UIImage(named: "icon14")
    }
}
