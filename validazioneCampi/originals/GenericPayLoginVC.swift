////
////  GenericPayLoginVC.swift
////  Consip8
////
////  Created by Stefano Cardia Dev on 04/02/21.
////
//
//
//enum GenPayFieldsList : String, CaseIterable {
//    case codEnteCred = "Codice ente creditore"
//    case codIUV = "Codice IUV"
//}
//
//import UIKit
//
//class GenericPayLoginVC: UIViewController {
//
//    
//    @IBOutlet weak var instructionLabel: TIMAppCustomLabel!
//    @IBOutlet weak var containerView: UIView!
//    @IBOutlet weak var genericPayTable: UITableView!
//    @IBOutlet weak var footerButtonOut: TIMDarkRoundedButton!
//    
//    var rows: [TableViewCellProtocol] = []
//    //usati per validazione
//    private var TEMP_Name = false
//    private var codEnteCred = ""
//    private var TEMPcodIUV = false
//    private var codIUV = ""
//    private var goingForwards = false
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setNavigtionBar(title: "Pagamento Generico", type: .title)
//        setGenericUI()
//        setUpTableView()
//        
//        fillRowsWithObjects()
//        self.footerButtonOut.isEnabled = false
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        goingForwards = false
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        if self.goingForwards {
////            Analytics.logEvent(C.FirebaseAnalyticsTags.genericPayment, parameters: [
////                C.FirebaseAnalyticsTags.type : C.FirebaseAnalyticsTags.genericPaymentToWebView
////            ])
//            print("vado avanti")
//        } else {
////            Analytics.logEvent(C.FirebaseAnalyticsTags.genericPayment, parameters: [
////                C.FirebaseAnalyticsTags.type : C.FirebaseAnalyticsTags.genericPaymentToEnteList
////            ])
//            print("torno indietro")
//        }
//        
//
//    }
//    private func setGenericUI() {
//        
//        self.instructionLabel.text = "Effettua il pagamento inserendo i dati forniti dall'ente."
//        self.navigationController?.navigationBar.tintColor = .white //.timWhite
//        
//    }
//    
//    private func setUpTableView() {
//        
//        genericPayTable.delegate = self
//        genericPayTable.dataSource = self
//        genericPayTable.tableFooterView = UIView() //hides unwanted rows
//        
//        genericPayTable.separatorStyle = .none
////        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
////        institutionsTable.refreshControl = refreshControl
//    }
//    
//    
//    
//    ///aggiorna le celle della tableview con oggetti aggiornati
//    private func fillRowsWithObjects() {
//        self.rows = []
//        
//        for fieldName in GenPayFieldsList.allCases {
//            switch fieldName {
//            case .codEnteCred, .codIUV:
//                self.rows.append(GenPayCellRowObject(delegate: self, identity: fieldName.rawValue, personField: fieldName))
//            }
//        }
//        
//        self.genericPayTable.reloadData()
//    }
//    
//    
//    @IBAction func footerButtonTapped(_ sender: Any) {
////        logger.debug("paga comodo \ncodEnteCred: \(self.codEnteCred), codIUV: \(self.codIUV)")
////        self.route(to: .pagaComodoWebVC, ["codEnteCred": "\(self.codEnteCred)", "codIUV":"\(self.codIUV)"])
//                
//        print("footer tapped")
//        self.goingForwards = true
//
//        
//    }
//    
//
//}
//
//
////MARK: - EXTENSIONS
//
////MARK: - tableView section
//extension GenericPayLoginVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
//}
//
//extension GenericPayLoginVC: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.rows.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //
//        //        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! CustomTestCell
//        //        cell.testLabel.text = self.FieldsList[indexPath.row]
//        
//        let model = rows[indexPath.row]
//        
//        let cell = self.genericPayTable.dequeueReusableCell(withIdentifier: model.cellClass.identifier_GivenByExtension, for: indexPath)
//        model.config(cell: cell)
//        
//        return cell
//        
//    }
//    
//}
//
//
//extension GenericPayLoginVC: GenPayCellDelegate {
//    
//    
//    func didTapInfoButton(id: String) {
//        print("tapped info")
//    }
//    
//    func canEnableButton(fromField: String, statusForEnableIs: Bool) {
//        
//        switch fromField {
//        case GenPayFieldsList.codEnteCred.rawValue:
//            self.TEMPcodEnteCred = statusForEnableIs
//        case GenPayFieldsList.codIUV.rawValue:
//            self.TEMPcodIUV = statusForEnableIs
//        default:
//            break
//        }
//        
//        //i campi "obbligatori" per abilitare il bottone
//        let requiredFields = TEMPcodEnteCred && TEMPcodIUV
//        if requiredFields {
//            self.footerButtonOut.isEnabled = true
//        } else {
//            self.footerButtonOut.isEnabled = false
//        }
//        
//    }
//    
//    ///qui salvo i dati in userdefaults //sembra non sia richiesto
//    func getDataFromCell(fromCell: String, data: String) {
//        
//        switch fromCell {
//        case GenPayFieldsList.codEnteCred.rawValue:
////            UserSettingsManager.shared.institutonIdCode = data
//            self.codEnteCred = data
//        case GenPayFieldsList.codIUV.rawValue:
//            self.codIUV = data
//        default:
//            break
//        }
//        
//    }
//    
//}
//
//
//
//
//extension GenericPayLoginVC: AlertErroreGenericoVCDelegate {
//    
//    
//    func alertErroreGenericoDidTapDismiss() {
//        logger.debug("\n✅ sctest dismiss")
//        dismiss(animated: false, completion: nil)
//    }
//    
//    func alertErroreGenericoDidTapClose(_ alertErroreGenericoVC: AlertErroreGenericoVC) {
//        logger.debug("\n✅ sctest azione di riprova")
//        dismiss(animated: false, completion: nil)
//    }
//    
//}
