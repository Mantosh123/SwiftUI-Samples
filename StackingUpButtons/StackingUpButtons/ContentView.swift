//
//  ContentView.swift
//  StackingUpButtons
//
//  Created by Mantosh Kumar on 06/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var country = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State var correctAnser = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scroeTitle = ""
    
    var body: some View {
        
        ZStack {
            //Color.purple.ignoresSafeArea()
            
            RadialGradient(stops: [.init(color: .orange, location: 0.3),
                                   .init(color: .blue, location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            
            VStack {
                
                Text("Guess the Flag ").font(.title.bold()).foregroundColor(.white)
                
                VStack(spacing: 15) {
                    Text("Tap on the Flag").foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(country[correctAnser]).bold()
                        .font(.title)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        }label: {
                            Image(country[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                        
                    }.alert(scroeTitle, isPresented: $showingScore) {
                        Button("Continue", action: askQuestions)
                    } message: {
                        Text("Your score is ???")
                    }
                    
                    
                } .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                
                Text("Score ???").foregroundStyle(.white).font(.title.bold())
            }.padding()
            Spacer()
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnser {
            scroeTitle = "Correct"
        } else {
            scroeTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestions() {
        country.shuffle()
        correctAnser = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
