//
//  UIResponder+Utils.swift
//  Password
//
//  Created by Edwin Cardenas on 3/17/23.
//

import UIKit

extension UIResponder {
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    /// Finds the current first responder
    ///  - Returns: the current UIResponder if exits
    static func currentFirstResponder() -> UIResponder? {
        Static.responder = nil
        
        // fires and event up to the responder chain
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        
        return Static.responder
    }
    
    @objc private func _trap() {
        // captures itself
        Static.responder = self
    }
}
