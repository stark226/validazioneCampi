//
//  UserSettingsManager.swift
//  Consip8
//
//  Created Marco Giacomini on 21/01/2021.
//  Copyright © 2021 TelecomItalia S.p.a.. All rights reserved.
//

//enum UsdefKeys: String, CaseIterable {
//    case name = "NAME"
//    case firstAccess = "FIRST_ACCESS"
//    case year = "YEAR"
//
//}



import Foundation

//UserSettingsManager
class USM: NSObject {
    
    static let shared = USM()
    
    var defaults : UserDefaults {
        get {
            return UserDefaults.standard
        }
    }
    
    private override init() {}
    

 

    var name : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.name.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.name.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    var surname : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.surname.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.surname.rawValue)
            defaults.synchronize()
        }
    }
    
    
    var mailAddress : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.mailAddress.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.mailAddress.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    
    var dato1 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato1.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato1.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    var dato2 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato2.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato2.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    var dato3 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato3.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato3.rawValue)
            defaults.synchronize()
        }
    }

    
    var dato4 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato4.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato4.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    
    
    var dato5 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato5.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato5.rawValue)
            defaults.synchronize()
        }
    }
    
    
    var dato6 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato6.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato6.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    
    
    var dato7 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato7.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato7.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    var dato8 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato8.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato8.rawValue)
            defaults.synchronize()
        }
    }
    
    
    var dato9 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato9.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato9.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    var dato10 : String {
        get {
            if let value : Any = defaults.object(forKey: Fields.dato10.rawValue) {
                return value as! String
            }else{
                return ""
            }
        }
        set(val) {
            defaults.set(val, forKey: Fields.dato10.rawValue)
            defaults.synchronize()
        }
    }
    
    
    
    
    
    func resetUserData (){
        
//        defaults.removeObject(forKey: UsdefKeys.name.rawValue)
//        defaults.removeObject(forKey: UsdefKeys.firstAccess.rawValue)
//        defaults.removeObject(forKey: UsdefKeys.year.rawValue)

        Fields.allCases.forEach { (key) in
//            defaults.
        }
        
        defaults.synchronize()
    }
}
