//
//  ViewController.swift
//  validazioneCampi
//
//  Created by Stefano Cardia Dev on 26/02/21.
//


enum ProfileSections: String, CaseIterable {
    case firstSection = "First Section"
    case secondSection = "Second Section"
}

enum Fields: String, CaseIterable {
    case name = "Type Your Name*"
    case surname = "type Your Surname*"
    case mailAddress = "type Your Email*"
    case dato1
    case dato2
    case dato3
    case dato4
    case dato5
    case dato6
    case dato7
    case dato8
    case dato9
    case dato10
}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var rows: [TableViewCellProtocol] = []
    
    private var required_Name = false
    private var required_surname = false
    private var required_mail = false
    
    @IBOutlet weak var footerButtonOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        fillRowsWithObjects()
        
        setUi()
    }
    
    private func setUi() {
        self.footerButtonOut.isEnabled = false
    }
    
    private func setUpTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tableFooterView = UIView() //hides unwanted rows
    }
    
    
    private func fillRowsWithObjects() {
        updateRows()
        self.myTableView.reloadData()
    }
    
    func updateRows() {
        
        self.rows = []
        
        for section in ProfileSections.allCases {
            
            self.rows.append(ValCell_RowObject(delegate: nil, identity: section.rawValue, background: .lightGray, fieldText: nil))
            #warning("x alex VALIDAZIONE: ti sembra una buona idea salvare i dati del paziente in unn singleton fino ad arrivare al momento in cui li salvi altrove? in questo modo posso usarli in molteplici contorller, ma soprattutto posso tenere le celel aggiorante")
            switch section {
            case .firstSection:
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.name.rawValue, fieldText: TempPatient.shared.saved_name))
            case .secondSection:
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.surname.rawValue, fieldText: TempPatient.shared.saved_surname))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.mailAddress.rawValue, fieldText: TempPatient.shared.saved_mailAddress))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato1.rawValue, fieldText: TempPatient.shared.saved_dato1))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato2.rawValue, fieldText: TempPatient.shared.saved_dato2))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato3.rawValue, fieldText: TempPatient.shared.saved_dato3))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato4.rawValue, fieldText: TempPatient.shared.saved_dato4))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato5.rawValue, fieldText: TempPatient.shared.saved_dato5))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato6.rawValue, fieldText: TempPatient.shared.saved_dato6))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato7.rawValue, fieldText: TempPatient.shared.saved_dato7))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato8.rawValue, fieldText: TempPatient.shared.saved_dato8))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato9.rawValue, fieldText: TempPatient.shared.saved_dato9))
                self.rows.append(ValCell_RowObject(delegate: self, identity: Fields.dato10.rawValue, fieldText: TempPatient.shared.saved_dato10))
                break
            }
            
        }
        
    }
    
    @IBAction func footerButtonTapped(_ sender: Any) {
        print("\(TempPatient.shared)")
        
        
        //            print("\TempPatient.shared.saved_surname")
        //            print("\TempPatient.shared.saved_mailAddress")
        //            print("\TempPatient.shared.saved_dato1")
        //            print("\TempPatient.shared.saved_dato2")
        //            print("\TempPatient.shared.saved_dato3")
        //            print("\TempPatient.shared.saved_dato4")
        //            print("\TempPatient.shared.saved_dato5")
        //            print("\TempPatient.shared.saved_dato6")
        //            print("\TempPatient.shared.saved_dato7")
        //            print("\TempPatient.shared.saved_dato8")
        //            print("\TempPatient.shared.saved_dato9")
        //            print("\TempPatient.shared.saved_dato10")
        
    }
    
}







//MARK: - tableView section
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = rows[indexPath.row]
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: model.cellClass.identifier_GivenByExtension, for: indexPath)
        model.config(cell: cell)
        return cell
    }
    
}


extension ViewController: ValidationSimpleCell_Delegate {
    
    
    
    func canEnableButton(fromField: String, statusForEnableIs: Bool) {
        #warning("x Alex VALIDAZIONE: questo metodo funziona, ma credo si possa fare diversamente")
        
        switch fromField {
        case Fields.name.rawValue:
            self.required_Name = statusForEnableIs
        case Fields.surname.rawValue:
            self.required_surname = statusForEnableIs
        case Fields.mailAddress.rawValue:
            self.required_mail = statusForEnableIs
        default:
            break
        }

        //        i campi "obbligatori" per abilitare il bottone
        let requiredFields = required_Name && required_surname && required_mail
        if requiredFields {
            self.footerButtonOut.isEnabled = true
        } else {
            self.footerButtonOut.isEnabled = false
        }
        
    }
    
    func getDataFromCell(fromCell: String, data: String) {
        
        switch fromCell {
        case Fields.name.rawValue:
            TempPatient.shared.saved_name = data
        case Fields.surname.rawValue:
            TempPatient.shared.saved_surname = data
        case Fields.mailAddress.rawValue:
            TempPatient.shared.saved_mailAddress = data
        case Fields.dato1.rawValue:
            TempPatient.shared.saved_dato1 = data
        case Fields.dato2.rawValue:
            TempPatient.shared.saved_dato2 = data
        case Fields.dato3.rawValue:
            TempPatient.shared.saved_dato3 = data
        case Fields.dato4.rawValue:
            TempPatient.shared.saved_dato4 = data
        case Fields.dato5.rawValue:
            TempPatient.shared.saved_dato5 = data
        case Fields.dato6.rawValue:
            TempPatient.shared.saved_dato6 = data
        case Fields.dato7.rawValue:
            TempPatient.shared.saved_dato7 = data
        case Fields.dato8.rawValue:
            TempPatient.shared.saved_dato8 = data
        case Fields.dato9.rawValue:
            TempPatient.shared.saved_dato9 = data
        case Fields.dato10.rawValue:
            TempPatient.shared.saved_dato10 = data
        default:
            break
        }
        let test = ValidatorClass.validateManyTextfields(cellIdentity: fromCell, cellTextfieldText: data)
        self.canEnableButton(fromField: fromCell, statusForEnableIs: test)

        #warning("x ALEX RIUSO CELLE : la soluzione ai problemi di ripetizione dell celle che avevo sembra essere questa 2/2")
        self.updateRows()
    }
}



class ValidatorClass {
    
    #warning("x alex la mia validzione, messa in una classe e fatto metodo statico è riusabile senza applicare estensioni.")
    static func validateManyTextfields(cellIdentity: String?, cellTextfieldText: String?, checkValidity: Bool = true) -> Bool {
        
        let textFromTextfield = cellTextfieldText ?? ""
        
        var isNameValid = true
        var isMailValid = true
        var isFieldEmpty = true

        var areAllValid = false
        
        if checkValidity {
            
            switch cellIdentity {
            case Fields.name.rawValue:
                isNameValid = !textFromTextfield.isNumber()
                isNameValid = textFromTextfield.isMinimumLong(limit: 4)
                isFieldEmpty = textFromTextfield.isEmpty
            case Fields.surname.rawValue:
                //nessuna validazione accessoria
                isFieldEmpty = textFromTextfield.isEmpty
                break
            case Fields.mailAddress.rawValue:
                isMailValid = textFromTextfield.isValidEmail()
                isFieldEmpty = textFromTextfield.isEmpty
            default:
                break
            }

            areAllValid = !isFieldEmpty && isNameValid && isMailValid

        }
        
        return areAllValid

    }
    
 
}


