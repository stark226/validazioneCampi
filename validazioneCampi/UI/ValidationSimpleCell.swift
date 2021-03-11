//
//  ValidationSimpleCell.swift
//  validazioneCampi
//
//  Created by Stefano Cardia Dev on 26/02/21.
//
//



protocol ValidationSimpleCell_Delegate: class {
    func getDataFromCell(fromCell: String, data: String)
    func canEnableButton(fromField: String, statusForEnableIs: Bool)
}

import UIKit

class ValidationSimpleCell: UITableViewCell {
    
    @IBOutlet weak var cellTextfield: UITextField!
    
    weak var delegate: ValidationSimpleCell_Delegate?
    private var model: ValCell_RowObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configCell(_ model: ValCell_RowObject) {
        
        self.model = model
        delegate = model.delegate
        
        cellTextfield.delegate = self
        
        styleUI(model)
        
        self.cellTextfield.clearButtonMode = .whileEditing
        self.cellTextfield.placeholder = model.identity
        
        
        #warning("x ALEX RIUSO CELLE: la soluzione ai problemi di ripetizione delle celle che avevo sembra essere questa 1/2")
        if let receivedText = model.fieldText {
            self.cellTextfield.text = receivedText
        } else if model.fieldText == "" {
            //do nothing
        } else {
            self.cellTextfield.text = nil
            self.cellTextfield.placeholder = model.identity
        }
        
        switch model.identity {
        case ProfileSections.firstSection.rawValue, ProfileSections.secondSection.rawValue:
            self.cellTextfield.isHidden = true
            self.cellTextfield.text = ""
            self.textLabel?.text = model.identity
            self.textLabel?.isHidden = false
        default:
            self.cellTextfield.isHidden = false
            self.cellTextfield.text = self.model?.fieldText
            self.textLabel?.text = ""
            self.textLabel?.isHidden = true
        }
       
        //test per salvare i dati nello susers default
        //        switch model.identity {
        //        case ProfileSections.firstSection.rawValue, ProfileSections.secondSection.rawValue:
        //            self.cellTextfield.isHidden = true
        //            self.textLabel?.text = model.identity
        //        case Fields.name.rawValue:
        //            self.cellTextfield.text = USM.shared.name
        //        case Fields.surname.rawValue:
        //            self.cellTextfield.text = USM.shared.surname
        //        case Fields.mailAddress.rawValue:
        //            self.cellTextfield.text = USM.shared.mailAddress
        //        case Fields.dato1.rawValue:
        //            self.cellTextfield.text = USM.shared.dato1
        //        case Fields.dato2.rawValue:
        //            self.cellTextfield.text = USM.shared.dato2
        //        case Fields.dato3.rawValue:
        //            self.cellTextfield.text = USM.shared.dato3
        //        case Fields.dato4.rawValue:
        //            self.cellTextfield.text = USM.shared.dato4
        //        case Fields.dato5.rawValue:
        //            self.cellTextfield.text = USM.shared.dato5
        //        case Fields.dato6.rawValue:
        //            self.cellTextfield.text = USM.shared.dato6
        //        case Fields.dato7.rawValue:
        //            self.cellTextfield.text = USM.shared.dato7
        //        case Fields.dato8.rawValue:
        //            self.cellTextfield.text = USM.shared.dato8
        //        case Fields.dato9.rawValue:
        //            self.cellTextfield.text = USM.shared.dato9
        //        case Fields.dato10.rawValue:
        //            self.cellTextfield.text = USM.shared.dato10
        //        default:
        //            self.textLabel?.text = ""
        //            self.cellTextfield.isHidden = false
        //        }
        
        
        
        
    }
    
    private func styleUI(_ model: ValCell_RowObject ) {
        self.backgroundColor = model.background
    }
    
}









//MARK: - object for tableView
class ValCell_RowObject: TableViewCellProtocol {
    
    var identity: String
    var cellClass: UITableViewCell.Type = ValidationSimpleCell.self
    var delegate: ValidationSimpleCell_Delegate?
    
    var background: UIColor
    var fieldText: String?
    init(
        delegate: ValidationSimpleCell_Delegate? = nil,
        identity: String,
        background: UIColor = .systemBackground,
        fieldText: String?
    ) {
        
        self.delegate = delegate
        self.identity = identity
        
        self.background = background
        self.fieldText = fieldText
    }
    
    func config(cell: UITableViewCell) {
        (cell as? ValidationSimpleCell)?.configCell(self)
    }
}






extension ValidationSimpleCell: UITextFieldDelegate {
    
    #warning("x Alex VALIDAZIONE: per la validazione sembra più affidabile di quello con il shouldChangeCharactersIn")
    func textFieldDidChangeSelection(_ textField: UITextField) {
//        cell_CheckFieldsEmptiness(checkValidity: true)
        delegate?.getDataFromCell(fromCell: model?.identity ?? "N/A", data: textField.text ?? "N/A")
        
        
        #warning("se in questa cella volessi mettere un textfiled, che deve aggiornare una label in questa stessa cella, sarebbe giusto inserire qui qualcosa come questo?")
//        delegate?.getDataFromCell(fromCell: self.model?.identity ?? "N/A", data: textField.text ?? "N/A")
//        let value: Double? = Double(textField.text ?? "no")
//        let wantedResult = DataManager.shared.pesoDesiderabile(inputValue: value)
//        self.cellResultlabel.text = wantedResult.ToString()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == cellTextfield {
            let _ = cellTextfield.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        cell_CheckFieldsEmptiness(checkValidity: true)
        return true
    }
    
}


