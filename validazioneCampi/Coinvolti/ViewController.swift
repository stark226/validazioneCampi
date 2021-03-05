//
//  ViewController.swift
//  validazioneCampi
//
//  Created by Stefano Cardia Dev on 26/02/21.
//


#warning("🔍 questo esempio funziona, è semplice, ma permette di fare la validazione correttamente cella per cella e impostare condizioni speficiche, ho inserito le varie estensioni a carico della String, cosi le posso usare anche altro in una eventuale app")

#warning("🔍 ho fatto anche un tentativo per usare estensione dei protocolli")

enum ProfileSections: String, CaseIterable {
    case firstSection = "First Section" //se vuoi che la prima section non copaia metti ""
    case secondSection = "Second Section"
}

enum Fields: String, CaseIterable {
    case name = "Type Your Name"
    case surname = "type Your Surname"
    case mailAddress = "type Your Email"
}

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var rows: [TableViewCellProtocol] = []

    //usati per validazione
    @IBOutlet weak var footerButtonOut: UIButton!
    
    private var TEMP_Name = false
    private var theName = ""
    
    private var TEMP_surname = false
    private var theSurname = ""
    
    private var TEMP_mail = false
    private var theMail = ""
    
    private var goingForwards = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    
        fillRowsWithObjects()
        self.footerButtonOut.isEnabled = false
     
    }
    
    

    private func setUpTableView() {
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tableFooterView = UIView() //hides unwanted rows
        
//        profileTable.separatorStyle = .none
//        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
//        institutionsTable.refreshControl = refreshControl
    }
    
    
    ///aggiorna le celle della tableview con oggetti aggiornati
    private func fillRowsWithObjects() {
        self.rows = []
        
        for section in ProfileSections.allCases {
      
//            if section != ProfileSections.info {
            self.rows.append(ValidationSimpleCell_RowObject(delegate: self, identity: section.rawValue, background: .lightGray))
//            }

            switch section {
            case .firstSection:
                self.rows.append(ValidationSimpleCell_RowObject(delegate: self, identity: Fields.name.rawValue))
            case .secondSection:
                self.rows.append(ValidationSimpleCell_RowObject(delegate: self, identity: Fields.surname.rawValue))
                self.rows.append(ValidationSimpleCell_RowObject(delegate: self, identity: Fields.mailAddress.rawValue))
                break
            }
            
        }
        
        self.myTableView.reloadData()
    }
    
    
    @IBAction func footerButtonTapped(_ sender: Any) {
    }
    
}




//MARK: - tableView section
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selected = self.rows[indexPath.row]
        
        switch selected.identity {
        case Fields.name.rawValue:
            print("go to name")
        case Fields.surname.rawValue:
            print("go to surname")
        case Fields.mailAddress.rawValue:
            print("got o mail")
        default:
            break
        }
        
        self.myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        //        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! CustomTestCell
        //        cell.testLabel.text = self.FieldsList[indexPath.row]
        
        let model = rows[indexPath.row]
        
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: model.cellClass.identifier_GivenByExtension, for: indexPath)
        model.config(cell: cell)
        
        return cell
        
    }
    
}


extension ViewController: ValidationSimpleCell_Delegate {
     
    func canEnableButton(fromField: String, statusForEnableIs: Bool) {
        
        switch fromField {
        case Fields.name.rawValue:
            self.TEMP_Name = statusForEnableIs
        case Fields.surname.rawValue:
            self.TEMP_surname = statusForEnableIs
        case Fields.mailAddress.rawValue:
            self.TEMP_mail = statusForEnableIs
        default:
            break
        }
        
//        i campi "obbligatori" per abilitare il bottone
        let requiredFields = TEMP_Name && TEMP_surname && TEMP_mail
        if requiredFields {
            self.footerButtonOut.isEnabled = true
        } else {
            self.footerButtonOut.isEnabled = false
        }
        
    }
    
    ///qui salvo i dati in userdefaults //sembra non sia richiesto
    func getDataFromCell(fromCell: String, data: String) {
        
        switch fromCell {
        case Fields.name.rawValue:
//            UserSettingsManager.shared.institutonIdCode = data
            self.theName = data
        print("SALVA SU USEDEF \(data)")
        case Fields.surname.rawValue:
            self.theSurname = data
        print("SALVA SU USEDEF \(data)")
        case Fields.mailAddress.rawValue:
        print("SALVA SU USEDEF \(data)")
        default:
            break
        }
        
    }
}
