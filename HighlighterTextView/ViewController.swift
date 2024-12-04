//
//  ViewController.swift
//  HighlighterTextView
//
//  Created by Erik Flores Quispe on 3/12/24.
//

import UIKit

class ViewController: UIViewController {
    let hightlighter = HighlighterTextView()
    let hightlighterDelegate = HightlightTextViewDelegate()

    let textView: HightlightTextView = {
        let tv = HightlightTextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        textView.delegate = hightlighterDelegate

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])

        // Texto inicial (ejemplo JSON)
        textView.text = readJSONFile(fileName: "sample")

        // Aplicas el resaltado por primera vez
        hightlighter.highlight(textView: textView)
    }
}

