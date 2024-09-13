//
//  ContentView.swift
//  WordGame
//
//  Created by Mantosh Kumar on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorMsg = ""
    @State private var errorTitle = ""
    @State private var showingError = true
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        
                    }
                }
                
            }
            .navigationTitle($rootWord)
            .onSubmit { addNewWord() }
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMsg)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let allWords = try? String(contentsOf: startWordURL) {
                 
                let allWords = allWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Mantosh"
                print("rootWord == \(rootWord)")
            }
        }
        //fatalError("Could not load or read file ")
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isPossibalWord(word: String) -> Bool {
        
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let missplacedRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: true, language: "en")
        return missplacedRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
     
        errorMsg = message
        errorTitle = title
         showingError = true
    }
}

#Preview {
    ContentView()
}
