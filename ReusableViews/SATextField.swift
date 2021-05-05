//
//  TextFields.swift
//  Spine
//
//  Created by apple on 07/01/21.
//

import SwiftUI

struct SATextField: UIViewRepresentable {
    private let tmpView = WrappableTextField()

    //var exposed to SwiftUI object init
    var tag:Int = 0
    var placeholder:String?
    var changeHandler:((String)->Void)?
    var onCommitHandler:(()->Void)?

    func makeUIView(context: UIViewRepresentableContext<SATextField>) -> WrappableTextField {
        tmpView.tag = tag
        tmpView.delegate = tmpView
        tmpView.placeholder = placeholder
        tmpView.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [
            NSAttributedString.Key.kern: 20
        ])
        tmpView.onCommitHandler = onCommitHandler
        tmpView.textFieldChangedHandler = changeHandler
        return tmpView
    }

    func updateUIView(_ uiView: WrappableTextField, context: UIViewRepresentableContext<SATextField>) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}



