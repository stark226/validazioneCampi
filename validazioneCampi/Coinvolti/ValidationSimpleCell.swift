//
//  ValidationSimpleCell.swift
//  validazioneCampi
//
//  Created by Stefano Cardia Dev on 26/02/21.
//



protocol ValidationSimpleCell_Delegate: class {
    func getDataFromCell(fromCell: String, data: String)
    func canEnableButton(fromField: String, statusForEnableIs: Bool)
//    func didTapInfoButton(id: String)
}

import UIKit

class ValidationSimpleCell: UITableViewCell {
    
    @IBOutlet weak var cellTextfield: UITextField!
    
    weak var delegate: ValidationSimpleCell_Delegate?
    private var model: ValidationSimpleCell_RowObject?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func configCell(_ model: ValidationSimpleCell_RowObject) {
        
        self.model = model
        delegate = model.delegate
        
        styleUI(model)
        
        cellTextfield.delegate = self
        
        testPrint(model: self.model!)
    }
    
    
    
    private func styleUI(_ model: ValidationSimpleCell_RowObject ) {
        //        institutionNameLabel.font = UIFont.timSansMedium(16)
        //        subtitleLable.font = UIFont.timSansRegular(16)
        //        //round view with initials
        //        self.leftContainerView.layer.cornerRadius = self.leftContainerView.frame.size.width / 2
        //        self.leftContainerView.clipsToBounds = true
        //        self.leftContainerView.layer.borderWidth = 0.5
        //        self.leftContainerView.backgroundColor = UIColor.white
        //        self.leftContainerView.layer.borderColor = UIColor.timDarkBlue.cgColor
        //
        //        self.initialsRoundLabel.font = UIFont.timSansRegular(20)
        //        self.initialsRoundLabel.textColor = UIColor.timDarkBlue
        //        initialsRoundLabel.textAlignment = .center
        //        //        myImage.image = UIImage(named: "rebels")
        //        //        myImage.clipsToBounds = true
        //
        self.backgroundColor = model.background

        self.cellTextfield.clearButtonMode = .whileEditing
        self.cellTextfield.placeholder = model.identity

        
        switch model.identity {
        case ProfileSections.firstSection.rawValue, ProfileSections.secondSection.rawValue:
            self.cellTextfield.isHidden = true
        default:
            self.cellTextfield.isHidden = false
        }
        //        //per avere il separator lungo quanto l'intera cella
        //        self.preservesSuperviewLayoutMargins = false
        //        self.separatorInset = UIEdgeInsets.zero
        //        self.layoutMargins = UIEdgeInsets.zero
    }
    
    //MARK: - validazione --------------------------------------------------------------------------------------
    func cell_CheckFieldsEmptiness(checkValidity: Bool = true) {

        let textFromTextfield = cellTextfield.text ?? ""
        var isLongEough = true
        var isMailValid = true
        if checkValidity {

            let isFieldEmpty = textFromTextfield.isEmpty

            //qui fai le varie validazioni a seconda del campo
            if self.model?.identity == Fields.name.rawValue {
            }

            switch self.model?.identity {
            case Fields.name.rawValue:
//                isLongEough = isMinimumLong(text: testo, limit: 4)
                isLongEough = textFromTextfield.isMinimumLong(limit: 4)
                isLongEough = !textFromTextfield.isNumber()
            case Fields.mailAddress.rawValue:
                isMailValid = textFromTextfield.isValidEmail()
            default:
                break
            }



            //qui la cella contribuisce dare il nulla osta per abilitare il bottone
            if !isFieldEmpty && isLongEough && isMailValid {
                self.model?.delegate?.canEnableButton(fromField: self.model?.identity ?? "N/A", statusForEnableIs: true)
            } else {
                self.model?.delegate?.canEnableButton(fromField: self.model?.identity ?? "N/A", statusForEnableIs: false)
            }

        }
    }

    //validazione --------------------------------------------------------------------------------------


   
    
}

    










//MARK: - object for tableView
class ValidationSimpleCell_RowObject: TableViewCellProtocol {
    
    var identity: String
    var cellClass: UITableViewCell.Type = ValidationSimpleCell.self
    var delegate: ValidationSimpleCell_Delegate?
    
    var background: UIColor
    
    init(
        delegate: ValidationSimpleCell_Delegate? = nil,
        identity: String,
        background: UIColor = .systemBackground
    ) {
        
        self.delegate = delegate
        self.identity = identity
        
        self.background = background
    }
    
    func config(cell: UITableViewCell) {
        (cell as? ValidationSimpleCell)?.configCell(self)
    }
}






extension ValidationSimpleCell: UITextFieldDelegate {
    
    
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        cell_CheckFieldsEmptiness(checkValidity: true)
////        SC_cell_CheckFieldsEmptiness(cellTextfield: cellTextfield, model: self.model)
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        if let text = textField.text, let textRange = Range(range, in: text) {
//            let updatedText = text.replacingCharacters(in: textRange, with: string)
            cell_CheckFieldsEmptiness(checkValidity: true)

            //              myvalidator(text: updatedText)
//        }
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        if textField == cellTextfield {
            let _ = cellTextfield.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        cell_CheckFieldsEmptiness(checkValidity: true)
//        SC_cell_CheckFieldsEmptiness(cellTextfield: cellTextfield, model: self.model)

        return true
    }
    
   
    
    
}





//devi cercare di rendere più generica questa cell_CheckFieldsEmptiness, ma hai il problema del delgato che è di un tipo preciso

//
//class Testone {
//
//    func cell_CheckFieldsEmptiness(checkValidity: Bool = true, cellTextfield: UITextField, model) {
//
//        let textFromTextfield = cellTextfield.text ?? ""
//        var isLongEough = true
//        var isMailValid = true
//        if checkValidity {
//
//            let isFieldEmpty = textFromTextfield.isEmpty
//
//            //qui fai le varie validazioni a seconda del campo
//            if self.model?.identity == Fields.name.rawValue {
//            }
//
//            switch self.model?.identity {
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
//                self.model?.delegate?.canEnableButton(fromField: self.model?.identity ?? "N/A", statusForEnableIs: true)
//            } else {
//                self.model?.delegate?.canEnableButton(fromField: self.model?.identity ?? "N/A", statusForEnableIs: false)
//            }
//
//        }
//    }
//
//}
