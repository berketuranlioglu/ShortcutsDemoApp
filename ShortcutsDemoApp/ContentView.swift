//
//  ContentView.swift
//  ShortcutsDemoApp
//
//  Created by Berke Turanlioglu on 12.01.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @StateObject private var viewModel = MainViewModel()
    @State private var isPresented: Bool = false
    @State private var noteString: String = ""
    private let dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.storedNotes, id: \.self) {
                    Text($0)
                }
                .onDelete(perform: { indexSet in
                    viewModel.deleteValuesFromUserDefaults(indexSet: indexSet)
                })
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { isPresented.toggle() }) {
                        HStack {
                            Text("Add Note")
                            Image(systemName: "plus")
                        }
                    }
                }
                ToolbarItem(placement: .topBarLeading) { EditButton() }
            }
            .sheet(isPresented: $isPresented) {
                List {
                    TextField("Add your note...", text: $noteString)
                        .presentationDetents([.medium, .large])
                    
                    Section {
                        Button("Add") {
                            viewModel.writeValuesToUserDefaults(value: noteString)
                            isPresented.toggle()
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .onAppear {
                viewModel.readValuesFromUserDefaults()
            }
            .onChange(of: scenePhase) { _ in
                viewModel.readValuesFromUserDefaults()
            }
        }
    }
}

#Preview {
    ContentView()
}
