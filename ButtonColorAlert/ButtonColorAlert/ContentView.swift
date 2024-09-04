//
//  ContentView.swift
//  ButtonColorAlert
//
//  Created by Mantosh Kumar on 04/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
        ZStack {
            Color.green
            VStack {
                Spacer()
//                AngularGradient(colors: [.red, .pink, .blue, .yellow, .blue, .white, .purple, .yellow], center: .center).padding()
                Spacer()
             
                Image(systemName: "figure.walk.circle")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello Mantosh!")
                
                
                Button("Show Alert") {
                    showAlert = true
                }.alert("Importent Message", isPresented: $showAlert) {
                    Button("Delete", role: .destructive) {}
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("Please read this.")
                }
                
                Button("Button 1") {} .buttonStyle(.bordered)
                Button("Button 2") {} .buttonStyle(.borderedProminent)
                Button("Button 3") {} .buttonStyle(.borderless)
                Button("Button 4", role: .destructive) {} .buttonStyle(.borderedProminent)
                
                Spacer()
                
            }.background(.white).padding()
            .padding()
            
            
        }.ignoresSafeArea()
        
        .navigationTitle("Color Button")
        }

    }
}

#Preview {
    ContentView()
}
