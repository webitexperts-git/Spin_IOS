//
//  CustomTextField.swift
//  Spine
//
//  Created by Aashita Tyagi on 30/03/21.
//

import Foundation
import SwiftUI

class WrappableTextField: UITextField, UITextFieldDelegate {
    var textFieldChangedHandler: ((String)->Void)?
    var onCommitHandler: (()->Void)?

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentValue = textField.text as NSString? {
            let proposedValue = currentValue.replacingCharacters(in: range, with: string)
            print(proposedValue)
            self.attributedText = NSAttributedString(string: currentValue as String, attributes: [
                NSAttributedString.Key.kern: 10
            ])
            textFieldChangedHandler?(proposedValue as String)
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        onCommitHandler?()
    }
}
