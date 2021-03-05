////
////  GenPayCell.swift
////  Consip8
////
////  Created by Stefano Cardia Dev on 05/02/21.
////
//
//protocol GenPayCellDelegate: class {
//    func getDataFromCell(fromCell: String, data: String)
//    func canEnableButton(fromField: String, statusForEnableIs: Bool)
//    func didTapInfoButton(id: String)
//}
//
//import UIKit
//
//class GenPayCell: UITableViewCell {
//    
//    @IBOutlet weak var cellTextfield: TimPayTextField!
//    var activeField: TimPayTextField?
//
//    weak var delegate: GenPayCellDelegate?
//    private var model: GenPayCellRowObject?
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }
//    
//    func configCell(_ model: GenPayCellRowObject) {
//        
//        self.model = model
//        delegate = model.delegate
//
//        cellTextfield.titleString = model.personField?.rawValue ?? "N/A"
//        cellTextfield.messageError = setMessage(forField: self.model?.identity)
//        cellTextfield.delegate = self
//        //exampleTextField.type = .currency
//        cellTextfield.type = .plain
//        cellTextfield.keyboardType = .default
//        cellTextfield.keyboardType = .asciiCapableNumberPad
//        cellTextfield.rightButtonImage = UIImage(named: "ico_info")
//        cellTextfield.rightButtonAction = rightButtonInfoAction
//    }
//
//    @objc private func rightButtonInfoAction() {
//        model?.delegate?.didTapInfoButton(id: model?.identity ?? "N/A")
//    }
//    
//    //MARK: - validazione --------------------------------------------------------------------------------------
//    func cell_CheckFieldsEmptiness(checkValidity: Bool = true) {
//        
//        let exampleTextFieldEmpty = cellTextfield.isEmpty()
//        let isFieldEmpty = exampleTextFieldEmpty
//        
//        var textfieldValid = true
//        
//        if checkValidity {
//            logger.debug("devo controllare...")
//            textfieldValid = validateData(forced: true) //compare errore
//            
//            //qui fai le varie validazioni a seconda del campo
////            if self.model?.identity == FieldsList.name.rawValue {
////                let numberOfLetters = "\(self.cellTextfield.getText() ?? "")"
////                textfieldValid =  numberOfLetters.count <= 4 ? false : true
////            }
//            
//            //qui la cella contribuisce dare il nulla osta per abilitare il bottone
//            if !isFieldEmpty && textfieldValid {
//                self.model?.delegate?.canEnableButton(fromField: self.model?.identity ?? "N/A", statusForEnableIs: true)
//            } else {
//                self.model?.delegate?.canEnableButton(fromField: self.model?.identity ?? "N/A", statusForEnableIs: false)
//            }
//
//        }
//        logger.debug("testo  \(self.cellTextfield.getText())")
//    }
//    
//    private func validateData(forced: Bool = true) -> Bool {
//        let exampleTextFieldValid = cellTextfield.validateInnerField(forced: forced)
//        
//        let dataValid = exampleTextFieldValid
//        
//        return dataValid
//    }
//    //validazione --------------------------------------------------------------------------------------
//
//    func setMessage(forField: String?) -> String {
//        
//        var message = "Il campo è sbagliato"
//        
//        if let forField = forField {
//            switch forField {
//            case GenPayFieldsList.codEnteCred.rawValue:
//                message = "codice ente sbagliato"
//            case GenPayFieldsList.codIUV.rawValue:
//                message = "codice IUV sbagliato"
//            default:
//                break
//            }
//        }
//        return message
//    }
//    
//}
//
//
////MARK: - object for tableView
//class GenPayCellRowObject: TableViewCellProtocol {
//    
//    var identity: String
//    var cellClass: UITableViewCell.Type = GenPayCell.self
//    var delegate: GenPayCellDelegate?
//        
//    var personField: GenPayFieldsList?
////    var cellFieldType: TimPayTextField.TimPayTextFieldType
//    
//    init(
//        delegate: GenPayCellDelegate? = nil,
//        identity: String,
//        personField: GenPayFieldsList?
////        cellFieldType: TimPayTextField.TimPayTextFieldType
//    ) {
//        
//        self.delegate = delegate
//        self.identity = identity
//        
//        self.personField = personField
////        self.cellFieldType = cellFieldType
//
//    }
//    
//    func config(cell: UITableViewCell) {
//        (cell as? GenPayCell)?.configCell(self)
//    }
//    
//}
//
//
//extension GenPayCell: TimPayTextFieldProtocol {
//
//    func textFieldShouldReturn(_ textField: TimPayTextField) -> Bool {
//        activeField = nil
//
//        if textField == cellTextfield {
//            let _ = cellTextfield.resignFirstResponder()
//            // NEXT se ci fossere piu' campilet _ = bankAccountTextField.becomeFirstResponder()
//        }
//
//        return true
//    }
//
//    func textFieldShouldBeginEditing(_ textField: TimPayTextField) -> Bool {
//        activeField = textField
//        return true
//    }
//
//    func textFieldDidEndEditing(_ textField: TimPayTextField) {
//        checkFieldsEmptiness(checkValidity: true) //validazione
//
//        guard let text = textField.getText() else {return}
////        if canSave {
//            delegate?.getDataFromCell(fromCell: self.model?.identity ?? "N/A", data: text)
////            delegate?.enableButton()
////        }
//
//    }
//
//    func textFieldShouldClear(_ textField: TimPayTextField) -> Bool {
//        checkFieldsEmptiness(checkValidity: true) //validazione
//        return true
//    }
//
//    func textEditChanged(_ textField: TimPayTextField) {
//        checkFieldsEmptiness(checkValidity: true) //validazione
//
//        guard let text = textField.getText() else {return}
////        if canSave {
//        delegate?.getDataFromCell(fromCell: self.model?.identity ?? "N/A", data: text)
////        delegate?.enableButton()
////        }
//
//    }
//
//    func currencyEditChanged(_ textField: TimPayTextField) {
//        checkFieldsEmptiness(checkValidity: true) //validazione
//    }
//
//}
