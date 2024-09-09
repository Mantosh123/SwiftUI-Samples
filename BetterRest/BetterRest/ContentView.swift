//
//  ContentView.swift
//  BetterRest
//
//  Created by Mantosh Kumar on 09/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weakup = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    @State private var showingData: Bool = true
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                    Text("When do you want to weakup")
                    DatePicker("Please enter time", selection: $weakup, displayedComponents: .hourAndMinute).labelsHidden()
                    Text("Desired amount of sleep:").font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                    Text("Daily coffee intake:").font(.headline)
                    Stepper("\(coffeAmount) cup (S)", value: $coffeAmount, in: 2...10, step: 1)
                }
            .toolbar {
                Button("Calculate", action: calculateValue)
            }
            .navigationTitle("Sleep Calculator App")
        }
            
        
    }
    
    func calculateValue() {
        alert("Alert", isPresented: $showingData) {
            Button("Ok", action: {})
            Button("Cancel", action: {})
        } message: {
            Text("Please enter Sleep Amount and coffe amount")
        }
    }
}

#Preview {
    ContentView()
}
