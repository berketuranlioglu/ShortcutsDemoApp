//
//  MainViewModel.swift
//  ShortcutsDemoApp
//
//  Created by Berke Turanlioglu on 12.01.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var storedNotes: [String] = []
    
    private let keyStoredNotes = "storedNotes"
    
    func readValuesFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: keyStoredNotes) {
            if let decodedData = try? JSONDecoder().decode([String].self, from: data) {
                storedNotes = decodedData
            }
        }
    }
    
    func writeValuesToUserDefaults(value: String) {
        readValuesFromUserDefaults()
        storedNotes.append(value)
        if let encodedData = try? JSONEncoder().encode(storedNotes) {
            UserDefaults.standard.set(encodedData, forKey: keyStoredNotes)
        }
    }
    
    func deleteValuesFromUserDefaults(indexSet: IndexSet) {
        storedNotes.remove(atOffsets: indexSet)
        if let encodedData = try? JSONEncoder().encode(storedNotes) {
            UserDefaults.standard.set(encodedData, forKey: keyStoredNotes)
        }
    }
}
