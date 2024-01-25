//
//  AddNoteShortcuts.swift
//  ShortcutsDemoApp
//
//  Created by Berke Turanlioglu on 16.01.2024.
//

import AppIntents

struct AddNoteShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AddNoteIntent(),
            phrases: [
                "Add a note",
                "Add a \(.applicationName) note"
            ],
            shortTitle: "Add a note",
            systemImageName: "pencil"
        )
    }
}
