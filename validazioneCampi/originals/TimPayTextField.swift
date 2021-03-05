////
////  TimPayTextField.swift
////  TIMpersonal
////
////  Created by Cinzia on 14/02/2020.
////  Copyright © 2020 TIM. All rights reserved.
////
//
//import UIKit
//
//@objc protocol TimPayTextFieldProtocol {
//    @objc optional func textField(_ textField: TimPayTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
//            
//    @objc optional func textFieldShouldBeginEditing(_ textField: TimPayTextField) -> Bool
//
//    @objc optional func textFieldDidBeginEditing(_ textField: TimPayTextField)
//
//    @objc optional func textFieldShouldEndEditing(_ textField: TimPayTextField) -> Bool
//
//    @objc optional func textFieldDidEndEditing(_ textField: TimPayTextField)
//
//    @objc optional func textFieldShouldClear(_ textField: TimPayTextField) -> Bool
//    
//    @objc optional func textFieldShouldReturn(_ textField: TimPayTextField) -> Bool
//    
//    @objc optional func currencyEditChanged(_ textField: TimPayTextField)
//    
//    @objc optional func textEditChanged(_ textField: TimPayTextField)
//}
//
//class TimPayTextField: UIView {
//
//    //MARK: - Inner and UI variables
//    
//    static var kTimPayNoMaxLength: Int = 0
//    
//    enum TimPayTextFieldType {
//        case plain
//        case currency
//        case datePicker
//    }
//    
//    @IBOutlet var contentView: UIView!
//    
//    var titleShown: Bool = false
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet var topPlaceholder: NSLayoutConstraint!
//    @IBOutlet var trailingPlaceholder: NSLayoutConstraint!
//    @IBOutlet var leadingPlaceholder: NSLayoutConstraint!
//    @IBOutlet var bottomPlaceholder: NSLayoutConstraint!
//
//    @IBOutlet weak  var textField: UITextField!
//    @IBOutlet weak private var currencyTextField: CurrencyTextField!
//    @IBOutlet weak var lettersCounterLabel: UILabel!
//    @IBOutlet var textFieldTrailingConstraint: NSLayoutConstraint!
//    
//    var rightButtonAction: (() -> Void)?
//    @IBOutlet weak var rightButton: UIButton!
//    @IBOutlet weak var coveringButton: UIButton!
//    @IBOutlet weak var rightButtonTrailingConstraint: NSLayoutConstraint!
//    @IBOutlet weak var rightButtonWidth: NSLayoutConstraint!
//    
//    @IBOutlet weak var separatorView: UIView!
//    
//    @IBOutlet weak var errorView: UIView!
//    @IBOutlet weak var errorLabel: UILabel!
//    
//    var delegate: TimPayTextFieldProtocol?
//    
//    var validateField: ((_ textField: UITextField, _ forced: Bool) -> Bool)?
//    
//    var isValidateChanged: ((_ valid: Bool) -> Void)?
//    
//    //MARK: - Private variables
//    
//    private var viewHeight: CGFloat = 0
//    
//    private var isRightButtonShown: Bool  = false
//
//    //MARK: - Configuration variables
//    
//    var type: TimPayTextFieldType = .plain {
//           didSet {
//               viewPropertiesChanged()
//           }
//       }
//    
//    @IBInspectable var titleString: String = "--" {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//
//    @IBInspectable var maxLength: Int = TimPayTextField.kTimPayNoMaxLength {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//
//    var keyboardType: UIKeyboardType = .default {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var autocapitalizationType: UITextAutocapitalizationType = .sentences {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var clearButtonMode: UITextField.ViewMode = .whileEditing {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var isEnabled: Bool = true {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var placeholderAppearance: (font: UIFont, color: UIColor) = (font: UIFont.timSansRegular(16), color: .timGray184) {
//        didSet {
//        }
//    }
//
//    var titleAppearance: (font: UIFont, color: UIColor) = (font: UIFont.timSansRegular(16), color: .timGray184) {
//        didSet {
//            titleLabel.font = titleAppearance.font
//            titleLabel.textColor = titleAppearance.color
//            lettersCounterLabel.textColor = titleAppearance.color
//        }
//    }
//
//    var textAppearance: (font: UIFont, color: UIColor) = (font: UIFont.timSansRegular(16), color: .timGray31) {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//
//    var errorAppearance: (font: UIFont, color: UIColor) = (font: UIFont.timSansRegular(12), color: .timRed) {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//
//    var separatorColor: UIColor = .timGray227 {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//
//    var isSecureTextEntry: Bool = false {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var rightButtonImage: UIImage? {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var extendRightButton: Bool = false {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var customInputView: UIView? {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//
//    var customInputAccessoryView: UIView? {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//
//    @IBInspectable var messageError: String = "Campo inserito non valido, riprova" {
//        didSet {
//            viewPropertiesChanged()
//        }
//    }
//    
//    var isTextFieldAccessEnabled: Bool = true {
//        didSet {
//            textField.isUserInteractionEnabled = isTextFieldAccessEnabled
//            currencyTextField.isUserInteractionEnabled = isTextFieldAccessEnabled
//        }
//    }
//
//    var rightButtonShownOnEditChanged: Bool = false {
//        didSet {
//            showRightButton()
//        }
//    }
//    
//    //MARK: - Inits and setup
//    
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.editingChanged(_:)), name: UITextField.textDidChangeNotification, object: nil)
//        self.setup()
//    }
//    
//    required override init(frame: CGRect) {
//        super.init(frame: frame)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.editingChanged(_:)), name: UITextField.textDidChangeNotification, object: nil)
//        self.setup()
//    }
//    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        switch type {
//        case .plain, .datePicker:
//            let frame = textField.rightView?.frame
//            if let f = frame {
//                var newframe = f
//                newframe.size.height = textField.frame.size.height
//                newframe.size.width = 40
//                textField.rightView?.frame = newframe
//            }
//        case .currency:
//            let frame = currencyTextField.rightView?.frame
//            if let f = frame {
//                var newframe = f
//                newframe.size.height = currencyTextField.frame.size.height
//                newframe.size.width = 40
//                currencyTextField.rightView?.frame = newframe
//            }
//        }
//    }
//    
//    private func setup() {
//        Bundle.main.loadNibNamed("\(Self.self)", owner: self, options: nil)
//        addSubview(contentView)
//        self.backgroundColor = .clear
//        viewHeight = contentView.frame.size.height
//        contentView.frame = self.bounds
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        
//        viewPropertiesChanged()
//        titleShown = false
//        titleLabel.font = titleAppearance.font
//        titleLabel.textColor = titleAppearance.color
//        lettersCounterLabel.textColor = titleAppearance.color
//
//        showError(false)
//        
//        textField.addTarget(self, action: #selector(textFieldEditingChanged(_ :)), for: UIControl.Event.editingChanged)
//        currencyTextField.addTarget(self, action: #selector(currencyTextFieldEditingChanged(_ :)), for: UIControl.Event.editingChanged)
//        currencyTextField.secondaryDelegate = self
//        
//        coveringButton.isHidden = true
//        
//        applyCustomClearButton()
//        
//        self.setNeedsLayout()
//    }
//    
//    @objc func editingChanged(_ sender: Any) {
//        switch type {
//        case .plain, .datePicker:
//            textFieldEditingChanged(sender)
//        case .currency:
//            currencyTextFieldEditingChanged(sender)
//        }
//    }
//    
//    @objc func textFieldEditingChanged(_ sender: Any) {
//        showTitle(animated: true)
//        showRightButton()
//        checkMaxLength()
//        updateLettersCounterLabel()
//    }
//
//    @objc func currencyTextFieldEditingChanged(_ sender: Any) {
//        showTitle(animated: true)
//    }
//
//    //MARK: - UI update after properties changing
//    
//    func viewPropertiesChanged() {
//        separatorView.backgroundColor = separatorColor
//        textField.font = textAppearance.font
//        textField.textColor = textAppearance.color
//        currencyTextField.font = textAppearance.font
//        currencyTextField.textColor = textAppearance.color
//        errorLabel.font = errorAppearance.font
//        errorLabel.textColor = errorAppearance.color
//        
//        errorLabel.text = messageError
//        titleLabel.text = titleString
//        textField.attributedPlaceholder = NSAttributedString(string: titleString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.clear])
//        textField.keyboardType = keyboardType
//        textField.clearButtonMode = clearButtonMode
//        textField.rightViewMode = clearButtonMode
//        textField.autocapitalizationType = autocapitalizationType
//        textField.isEnabled = isEnabled
//
//        currencyTextField.clearButtonMode = clearButtonMode
//        currencyTextField.rightViewMode = clearButtonMode
//        currencyTextField.keyboardType = keyboardType
//        currencyTextField.isEnabled = isEnabled
//        currencyTextField.attributedPlaceholder = NSAttributedString(string: titleString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.clear])
//
//        switch type {
//        case .plain, .datePicker:
//            textField.isHidden = false
//            currencyTextField.isHidden = true
//            textField.inputView = customInputView
//            textField.inputAccessoryView = customInputAccessoryView
//        case .currency:
//            textField.isHidden = true
//            currencyTextField.isHidden = false
//            currencyTextField.inputView = customInputView
//            currencyTextField.inputAccessoryView = customInputAccessoryView
//        }
//        
//        checkMaxLength()
//        updateLettersCounterLabel()
//        showTitle(animated: false)
//        
//        textField.isSecureTextEntry = isSecureTextEntry
//        if isSecureTextEntry {
//            isRightButtonShown = true
//            rightButton.setImage(UIImage(named: "nascondipassword"), for: .normal)
//        }
//        else {
//            if let image = rightButtonImage {
//                isRightButtonShown = true
//                rightButton.setImage(image, for: .normal)
//            }
//        }
//        
//        showRightButton()
//    }
//    
//    //MARK: - Buttons actions
//    
//    @IBAction func securityToggleAction(_ sender: Any) {
//        if isSecureTextEntry {
//            textField.isSecureTextEntry.toggle()
//            if textField.isSecureTextEntry {
//                rightButton.setImage(UIImage(named: "nascondipassword"), for: .normal)
//            }
//            else {
//                rightButton.setImage(UIImage(named: "mostrapassword"), for: .normal)
//            }
//        }
//        else {
//            rightButtonAction?()
//        }
//    }
//    
//    @IBAction func coveringButtonAction(_ sender: Any) {
//        rightButtonAction?()
//    }
//    
//    //MARK: - UITextField management
//    
//    override func resignFirstResponder() -> Bool {
//        super.resignFirstResponder()
//        switch type {
//        case .plain, .datePicker:
//            return textField.resignFirstResponder()
//        case .currency:
//            return currencyTextField.resignFirstResponder()
//        }
//    }
//    
//    override func becomeFirstResponder() -> Bool {
//        super.becomeFirstResponder()
//        switch type {
//        case .plain, .datePicker:
//            return textField.becomeFirstResponder()
//        case .currency:
//            return currencyTextField.becomeFirstResponder()
//        }
//    }
//    
//    @IBAction func currencyEditChanged(_ sender: Any) {
//        showTitle(animated: true)
//        delegate?.currencyEditChanged?(self)
//    }
//    
//    @IBAction func textEditChanged(_ sender: Any) {
//        showTitle(animated: true)
//        delegate?.textEditChanged?(self)
//    }
//    
//    //MARK: - Public functions
//    
//    func applyCustomClearButton(lightMode: Bool = false) {
//        textField.applyCustomClearButton(lightMode: lightMode)
//        currencyTextField.applyCustomClearButton(lightMode: lightMode)
//    }
//    
//    func validateInnerField(forced: Bool) -> Bool {
//        var valid = false
//        
//        if isEmpty() {
//            valid = !forced
//        }
//        else {
//            switch type {
//            case .plain, .datePicker:
//                if let validation = validateField {
//                    valid = validation(textField, forced)
//                }
//                else {
//                    valid = true
//                }
//            case .currency:
//                if let validation = validateField {
//                    valid = validation(currencyTextField, forced)
//                }
//                else {
//                    valid = currencyTextField.hasValidAmount()
//                }
//            }
//        }
//        
//        showError(!valid)
//        return valid
//    }
//    
//    func isEmpty() -> Bool {
//        switch type {
//        case .plain, .datePicker:
//            return textField.text?.isEmpty ?? true
//        case .currency:
//            return currencyTextField.text?.isEmpty ?? true
//        }
//    }
//    
//    func setAmount(_ amount: Double?) {
//        guard type == .currency, let a = amount else { return }
//        currencyTextField.setAmount(amount: a)
//        viewPropertiesChanged()
//    }
//
//    func getAmount() -> Double? {
//        guard type == .currency, currencyTextField.hasValidAmount() else { return nil }
//        return currencyTextField.getAmount()
//    }
//
//    func getText() -> String? {
//        switch type {
//        case .plain, .datePicker:
//            return textField.text
//        case .currency:
//            return currencyTextField.text
//        }
//    }
//    
//    func setText(_ text: String?, checkValidate: Bool = true) {
//         switch type {
//         case .plain, .datePicker:
//             textField.text = text
//         case .currency:
//             currencyTextField.text = text
//         }
//        if checkValidate {
//            let _ = validateInnerField(forced: true)
//        }
//        viewPropertiesChanged()
//     }
//    
//    func resetContent() {
//        setText(nil, checkValidate: false)
//    }
//    
//    //MARK: - Private functions
//    
//    private func showRightButton() {
//        var show = isRightButtonShown
//        if show && rightButtonShownOnEditChanged {
//            show = !isEmpty()
//        }
//        
//        coveringButton.isHidden = true
//        if show {
//            rightButtonTrailingConstraint.constant = 0
//            rightButton.isHidden = false
//            if extendRightButton {
//                coveringButton.isHidden = false
//            }
//        }
//        else {
//            rightButtonTrailingConstraint.constant = -rightButtonWidth.constant
//            rightButton.isHidden = true
//        }
//    }
//
//    private func checkMaxLength() {
//        guard type == .plain,
//            maxLength > TimPayTextField.kTimPayNoMaxLength,
//            let prospectiveText = textField.text,
//            prospectiveText.count > maxLength else { return }
//
//        let selection = textField.selectedTextRange
//
//        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
//        let substring = prospectiveText[..<indexEndOfText]
//        textField.text = String(substring)
//
//        textField.selectedTextRange = selection
//    }
//    
//    private func updateLettersCounterLabel() {
//        if type == .plain, maxLength > TimPayTextField.kTimPayNoMaxLength {
//            
//            textFieldTrailingConstraint.isActive = true
//            lettersCounterLabel.isHidden = false
//            
//            if let count = textField.text?.count {
//                lettersCounterLabel.text = "\(count)/\(maxLength)"
//            }
//            else {
//                lettersCounterLabel.text = "\(0)/\(maxLength)"
//            }
//        }
//        else {
//            textFieldTrailingConstraint.isActive = false
//            lettersCounterLabel.isHidden = true
//        }
//    }
//    #warning("TODO questa era private")
//    /*private*/ func showError(_ show: Bool) {
//        errorView.isHidden = !show
//    }
//
//    private func activePlaceholderConstraint(_ active: Bool) {
//        topPlaceholder.isActive = active
//        trailingPlaceholder.isActive = active
//        leadingPlaceholder.isActive = active
//        bottomPlaceholder.isActive = active
//        titleLabel.font = active ? titleAppearance.font : UIFont(name: titleAppearance.font.fontName, size: titleAppearance.font.pointSize - 3)
//    }
//    
//    private func showTitle(animated: Bool) {
//        let showTitle = !isEmpty()
//        if showTitle != titleShown {
//            if animated {
//                UIView.animate(withDuration: 0.2, animations: {
//                    [weak self] in
//                    if self?.titleShown ?? false {
//                        self?.activePlaceholderConstraint(true)
//                    }
//                    else {
//                        self?.activePlaceholderConstraint(false)
//                    }
//                    self?.layoutIfNeeded()
//                }) { [weak self] _ in
//                    self?.titleShown = showTitle
//                }
//            }
//            else {
//                if titleShown {
//                    activePlaceholderConstraint(true)
//                }
//                else {
//                    activePlaceholderConstraint(false)
//                }
//                layoutIfNeeded()
//                titleShown = showTitle
//            }
//        }
//    }
//}
//
//// MARK: - UITextFieldDelegate
//
//extension TimPayTextField: UITextFieldDelegate {
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return delegate?.textField?(self, shouldChangeCharactersIn: range, replacementString: string) ?? true
//    }
//        
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        let _ = validateInnerField(forced: false)
//        return delegate?.textFieldShouldBeginEditing?(self) ?? true
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        delegate?.textFieldDidBeginEditing?(self)
//    }
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        return delegate?.textFieldShouldEndEditing?(self) ?? true
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let _ = validateInnerField(forced: false)
//        delegate?.textFieldDidEndEditing?(self)
//    }
//    
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        let _ = validateInnerField(forced: false)
//        return delegate?.textFieldShouldClear?(self) ?? true
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        let _ = validateInnerField(forced: false)
//        return delegate?.textFieldShouldReturn?(self) ?? false
//    }
//}
//
//// MARK: - Extension to customize UITextField clear button
//extension UITextField {
//    
//    func applyCustomClearButton(lightMode: Bool = false) {
//
//        let innerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.size.height))
////        innerView.backgroundColor = .green
//        let clearButton = UIButton(frame: CGRect.zero) //CGRect(x: 0, y: 0, width: 40, height: 20))
//        if lightMode {
//            clearButton.setImage(UIImage(named: "chiudiwhite"), for: .normal)
//        }
//        else {
//            clearButton.setImage(UIImage(named: "chiudi"), for: .normal)
//        }
//        clearButton.addTarget(self, action: #selector(clearPressed(_:)), for: .touchUpInside)
//        clearButton.contentVerticalAlignment = .bottom
//        
//        innerView.addSubview(clearButton)
//        clearButton.translatesAutoresizingMaskIntoConstraints = false
//        clearButton.leadingAnchor.constraint(equalTo: innerView.leadingAnchor).isActive = true
//        clearButton.trailingAnchor.constraint(equalTo: innerView.trailingAnchor).isActive = true
//        clearButton.bottomAnchor.constraint(equalTo: innerView.bottomAnchor).isActive = true
//        clearButton.heightAnchor.constraint(equalToConstant: innerView.frame.size.height).isActive = true
//        clearButton.widthAnchor.constraint(equalToConstant: innerView.frame.size.width).isActive = true
//        
//        rightView = innerView
//    }
//
//    @objc func clearPressed(_ sender: Any) {
//        text = ""
//        let _ = delegate?.textFieldShouldClear?(self)
//        NotificationCenter.default.post(name: UITextField.textDidChangeNotification, object: nil)
//    }
//}
