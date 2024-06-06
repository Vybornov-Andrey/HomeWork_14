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
            UIColor(named: "ColorText") ?? UIColor.black
        }
        
        static var blueColor: UIColor? {
            UIColor(named: "ColorIcon") ?? UIColor.blue
        }
        
        static var grayColor: UIColor? {
            UIColor(named: "ColorFon")
        }        
        
        static var grayColorHeader: UIColor? {
            UIColor(named: "ColorHeader")
        }
    }
    
    enum Image {
        static var profile = UIImage(named: "icon14")
        static var phone = UIImage(named: "phone")
        static var envelope = UIImage(named: "envelope")
        static var building = UIImage(named: "building")
        static var buildingSmall = UIImage(named: "buildingSmall")
        static var iconProfile = UIImage(named: "icon14")
        static var iconPhone = UIImage(named: "phpneFill")
        static var iconEmail = UIImage(named: "emailFill")
        static var iconFill = UIImage(named: "blueFill")
    }
}
