//
//  TempPatient.swift
//  Pods
//
//  Created by Stefano Cardia Dev on 08/03/21.
//

import Foundation

class TempPatient : NSObject {
   
    static let shared = TempPatient()
    
    private override init() {}
    
    var saved_name: String? = nil
    var saved_surname: String? = nil
    var saved_mailAddress: String? = nil
    var saved_dato1: String? = nil
    var saved_dato2: String? = nil
    var saved_dato3: String? = nil
    var saved_dato4: String? = nil
    var saved_dato5: String? = nil
    var saved_dato6: String? = nil
    var saved_dato7: String? = nil
    var saved_dato8: String? = nil
    var saved_dato9: String? = nil
    var saved_dato10: String? = nil
    
}
