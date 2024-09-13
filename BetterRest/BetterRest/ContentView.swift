//
//  ContentView.swift
//  BetterRest
//
//  Created by Mantosh Kumar on 09/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    var body: some View {
        
        NavigationStack {
            Form {
                Text("Desired amount of sleep:").font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake:").font(.headline)
                Stepper("\(coffeAmount) cup (S)", value: $coffeAmount, in: 2...10, step: 1)
            }
            .navigationTitle("Mantosh App")
        }
        
    }
}

#Preview {
    ContentView()
}



