//
//  HighlighterTextView.swift
//  HighlighterTextView
//
//  Created by Erik Flores Quispe on 3/12/24.
//

import UIKit

struct HighlighterTextView {
    func highlight(textView: UITextView) {
        guard let text = textView.text else { return }

        // Atributos base
        let font = UIFont.monospacedSystemFont(ofSize: 14, weight: .regular)
        let baseAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.label
        ]

        let attributedString = NSMutableAttributedString(string: text, attributes: baseAttributes)

        // Patrones
        let keyPattern = "(?<=\")[^\"\\n]*(?=\")(?=\\s*:)"
        let stringPattern = "\"(.*?)\""
        let numberPattern = "\\b\\d+(\\.\\d+)?\\b"
        let boolPattern = "\\btrue\\b|\\bfalse\\b"
        let symbolPattern = "[{}\\[\\]:,]"

        if let keyRegex = try? NSRegularExpression(pattern: keyPattern, options: []) {
            applyAttributes(regex: keyRegex, to: attributedString, color: UIColor.systemOrange)
        }

        if let stringRegex = try? NSRegularExpression(pattern: stringPattern, options: []) {
            applyAttributes(regex: stringRegex, to: attributedString, color: UIColor.systemGreen)
        }

        if let numberRegex = try? NSRegularExpression(pattern: numberPattern, options: []) {
            applyAttributes(regex: numberRegex, to: attributedString, color: UIColor.systemBlue)
        }

        if let boolRegex = try? NSRegularExpression(pattern: boolPattern, options: [.caseInsensitive]) {
            applyAttributes(regex: boolRegex, to: attributedString, color: UIColor.systemPurple)
        }

        if let symbolRegex = try? NSRegularExpression(pattern: symbolPattern, options: []) {
            applyAttributes(regex: symbolRegex, to: attributedString, color: UIColor.systemGray)
        }

        textView.attributedText = attributedString
    }

    private func applyAttributes(regex: NSRegularExpression, to attributedString: NSMutableAttributedString, color: UIColor) {
        let range = NSRange(location: 0, length: attributedString.length)
        let matches = regex.matches(in: attributedString.string, options: [], range: range)
        for match in matches {
            attributedString.addAttribute(.foregroundColor, value: color, range: match.range)
        }
    }
}
