//
//  UITableViewCell+extensions.swift
//  validazioneCampi
//
//  Created by Stefano Cardia Dev on 28/02/21.
//

import UIKit

protocol CanValiateThings {
    
    func testPrint(model:TableViewCellProtocol)
//    func SC_cell_CheckFieldsEmptiness(checkValidity: Bool, cellTextfield: UITextField, model: TableViewCellProtocol?)
}

extension CanValiateThings {
    
    func testPrint(model:TableViewCellProtocol) {
        print("model \(model.identity)")
        
    }
    
    //MARK: - validazione --------------------------------------------------------------------------------------
//    func SC_cell_CheckFieldsEmptiness(checkValidity: Bool = true, cellTextfield: UITextField, model: TableViewCellProtocol?) {
//
//        let textFromTextfield = cellTextfield.text ?? ""
//        var isLongEough = true
//        var isMailValid = true
//        if checkValidity {
//
//            let isFieldEmpty = textFromTextfield.isEmpty
//
//            //qui fai le varie validazioni a seconda del campo
//            if model?.identity == Fields.name.rawValue {
//            }
//
//            switch model?.identity {
//            case Fields.name.rawValue:
////                isLongEough = isMinimumLong(text: testo, limit: 4)
//                isLongEough = textFromTextfield.isMinimumLong(limit: 4)
//                isLongEough = !textFromTextfield.isNumber()
//            case Fields.mailAddress.rawValue:
//                isMailValid = textFromTextfield.isValidEmail()
//            default:
//                break
//            }
//
//
//
//            //qui la cella contribuisce dare il nulla osta per abilitare il bottone
//            if !isFieldEmpty && isLongEough && isMailValid {
//                model?.delegate?.canEnableButton(fromField: model?.identity ?? "N/A", statusForEnableIs: true)
//            } else {
//                model?.delegate?.canEnableButton(fromField: model?.identity ?? "N/A", statusForEnableIs: false)
//            }
//
//        }
//    }

    //validazione --------------------------------------------------------------------------------------
    
    
}


extension UITableViewCell: CanValiateThings {}




//protocol UpperDelegate {
//    var delegate: ValidationSimpleCell_Delegate? {get set}
//}

