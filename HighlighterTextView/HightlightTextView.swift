//
//  HightlightTextView.swift
//  HighlighterTextView
//
//  Created by Erik Flores Quispe on 3/12/24.
//

import UIKit

class HightlightTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: .zero, textContainer: .none)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    func setup() {
        isEditable = true
        translatesAutoresizingMaskIntoConstraints = false
        smartQuotesType = .no
        autocapitalizationType = .none
        autocorrectionType = .no
    }
}
