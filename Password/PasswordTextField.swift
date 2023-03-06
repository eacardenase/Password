//
//  PasswordTextField.swift
//  Password
//
//  Created by Edwin Cardenas on 3/4/23.
//

import UIKit

class PasswordTextField: UIView {
    
    let lockImageView = UIImageView()
    let textField = UITextField()
    let placeHolderText: String
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorMessageLabel = UILabel()
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
}

extension PasswordTextField {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        lockImageView.image = UIImage(systemName: "lock.fill")
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = placeHolderText
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.placeholderText
        ])
        textField.keyboardType = .asciiCapable // limiting the characters the user can type into the textfield
//        newPasswordTextField.delegate = self
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.text = "Your password must meet the requirements below."
//        errorMessageLabel.adjustsFontSizeToFitWidth = true // deals with long text (not recommended)
//        errorMessageLabel.minimumScaleFactor = 0.8 // deals with long text (not recommended)
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.lineBreakMode = .byWordWrapping
        errorMessageLabel.isHidden = false
        
    }
    
    func layout() {
        addSubview(lockImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorMessageLabel)
        
        // lockImageView
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
        // newPasswordTextField
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: lockImageView.topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1)
        ])
        
        // passwordToggleButton
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: lockImageView.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // dividerView
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        // errorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4),
            errorMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // CHCR
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
}

// MARK: - Actions
extension PasswordTextField {
    @objc func togglePasswordView() {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
