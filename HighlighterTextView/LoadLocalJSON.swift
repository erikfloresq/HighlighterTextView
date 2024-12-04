//
//  LoadLocalJSON.swift
//  HighlighterTextView
//
//  Created by Erik Flores Quispe on 3/12/24.
//

import Foundation

func loadLocalJSON(fileName: String) -> Any? {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return nil }
    let url = URL(fileURLWithPath: path)
    do {
        let data = try Data(contentsOf: url)
        return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    } catch {
        print("Error al cargar JSON: \(error)")
        return nil
    }
}

func readJSONFile(fileName: String) -> String? {
    // Obtener la URL del archivo dentro del bundle
    guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        print("No se encontró el archivo \(fileName).json en el bundle.")
        return nil
    }

    do {
        // Leer el contenido del archivo
        let data = try Data(contentsOf: fileURL)
        // Convertir los datos a String
        if let jsonString = String(data: data, encoding: .utf8) {
            return jsonString
        } else {
            print("No se pudo convertir el contenido a String.")
            return nil
        }
    } catch {
        print("Error al leer el archivo: \(error.localizedDescription)")
        return nil
    }
}
