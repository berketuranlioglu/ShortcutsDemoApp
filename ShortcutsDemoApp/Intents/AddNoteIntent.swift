//
//  AddNoteIntent.swift
//  ShortcutsDemoApp
//
//  Created by Berke Turanlioglu on 12.01.2024.
//

import AppIntents
import SwiftUI

struct AddNoteIntent: AppIntent {
    static let title: LocalizedStringResource = "Add a note"
    
    @Parameter(title: "Add a note")
    var note: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let viewModel = MainViewModel()
        viewModel.writeValuesToUserDefaults(value: note)
        return .result(dialog: "Note is added: \(note)")
    }
}
