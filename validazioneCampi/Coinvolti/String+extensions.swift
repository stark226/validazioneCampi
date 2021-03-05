//
//  String+extensions.swift
//  validazioneCampi
//
//  Created by Stefano Cardia Dev on 28/02/21.
//

import Foundation

extension String {
    
    //MARK: validazione
    func isValidFiscalCode(_ fiscalCode: String) -> Bool {
        let fiscalCodeRegEx = "^[a-zA-Z]{6}[0-9]{2}[abcdehlmprstABCDEHLMPRST]{1}[0-9]{2}([a-zA-Z]{1}[0-9]{3})[a-zA-Z]{1}$"
        
        let fiscalCodePred = NSPredicate(format:"SELF MATCHES %@", fiscalCodeRegEx)
        return fiscalCodePred.evaluate(with: fiscalCode)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    ///controlla che sia lunga almeno quanto il limite
    func isMinimumLong(limit: Int) -> Bool {
        return self.count >= 4 ? true : false
    }
    
    ///controlla che sia SOLO numeri
    func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    

}

