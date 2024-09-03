//
//  ContentView.swift
//  SwiftUITextField
//
//  Created by Mantosh Kumar on 03/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userMobileNumber: Int?
    @State private var userName: String?
    
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var tipPercentages = [10,20,30,40,50]
    @FocusState private var isKeyboardFocus: Bool
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Form {
                    List {
                        TextField("Enter your mobile Number", value: $userMobileNumber, format: .number)
                            .keyboardType(.numberPad)
                            .focused($isKeyboardFocus)
                        
                        
                            Picker("Select value from picker", selection: $numberOfPeople) {
                                ForEach(1..<50) {
                                    Text("\($0) people")
                                }
                            }.pickerStyle(.navigationLink)
                        
                        
                        Section {
                            Picker("Percentage value", selection: $tipPercentage) {
                                ForEach(tipPercentages, id: \.self) {
                                    Text(($0), format: .percent)
                                }
                            }
                        }
                        
                        Section("How much do u want to give tip?") {
                            Picker("Percentage segment value", selection: $tipPercentage) {
                                ForEach(tipPercentages, id: \.self) {
                                    Text(($0), format: .percent)
                                }
                            }.pickerStyle(.segmented)
                        }
                        
                    }
                }
            }.navigationTitle("Day-17")
                .toolbar {
                    if isKeyboardFocus {
                        Button("Done") {
                            isKeyboardFocus = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
