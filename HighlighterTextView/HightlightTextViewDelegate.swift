//
//  HightlightTextViewDelegate.swift
//  HighlighterTextView
//
//  Created by Erik Flores Quispe on 3/12/24.
//

import UIKit

class HightlightTextViewDelegate: NSObject, UITextViewDelegate {
    let hightlighter = HighlighterTextView()

    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        if text == "\n" {
            // Obtener el texto actual hasta la posición del cursor
            let currentText = textView.text as NSString
            let prefixText = currentText.substring(to: range.location)

            // Calcular la indentación en base a llaves
            let indentationLevel = calculateIndentationLevel(for: prefixText)

            // Ahora usamos tabs en lugar de espacios
            let indentationString = "\n" + String(repeating: "\t", count: indentationLevel)

            // Reemplazar el texto en el UITextView
            if let textRange = textRangeFromNSRange(range: range, in: textView) {
                textView.replace(textRange, withText: indentationString)
            }

            return false
        }
        return true
    }

    func textViewDidChange(_ textView: UITextView) {
        // Cada vez que cambie el texto, vuelves a aplicar el resaltado
        // Conservar la posición del cursor
        let selectedRange = textView.selectedRange
        hightlighter.highlight(textView: textView)
        textView.selectedRange = selectedRange
    }
}


extension HightlightTextViewDelegate {
    private func calculateIndentationLevel(for text: String) -> Int {
        var level = 0
        for char in text {
            if char == "{" {
                level += 1
            } else if char == "}" {
                level -= 1
            }
        }
        return max(level, 0)
    }

    private func textRangeFromNSRange(range: NSRange, in textView: UITextView) -> UITextRange? {
        guard
            let startPosition = textView.position(from: textView.beginningOfDocument, offset: range.location),
            let endPosition = textView.position(from: startPosition, offset: range.length)
        else {
            return nil
        }
        return textView.textRange(from: startPosition, to: endPosition)
    }
}
