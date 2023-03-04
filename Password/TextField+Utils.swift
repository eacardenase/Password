//
//  TextField+Utils.swift
//  Password
//
//  Created by Edwin Cardenas on 3/3/23.
//

import UIKit

let passwordToggleButton = UIButton(type: .custom)
let lockButton = UIButton(type: .custom)

extension UITextField {
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        lockButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
        
        rightView = passwordToggleButton
        rightViewMode = .always
        
        leftView = lockButton
        leftViewMode = .always
    }
    
    @objc func togglePasswordView() {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
