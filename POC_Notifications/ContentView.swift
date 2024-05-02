//
//  ContentView.swift
//  POC_Notifications
//
//  Created by Ian Pacini on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon: Pikachu
    
    var body: some View {
        VStack {
            
            Image(pokemon.mood == .sad ? "pikachu_sad" : "pikachu_happy")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(30)
            Text("current mood: \n    \(pokemon.mood.rawValue.uppercased())")
                .bold()
            
            Button {
                changeMood(.happy)
            } label: {
                RoundedRectangle(cornerRadius: 14)
                    .frame(width: 150, height: 70)
                    .overlay(Text("Give attention").foregroundStyle(.white).bold())
            }
            
            Button {
                changeMood(.sad)
            } label: {
                RoundedRectangle(cornerRadius: 14)
                    .frame(width: 150, height: 70)
                    .overlay(Text("Dont give attention").foregroundStyle(.white).bold())
            }

        }
        .padding()
    }
    
    func changeMood(_ mood: Mood) {
        let moodResponse = ["pokemonMood": mood]
        
        NotificationCenter.default.post(name: NSNotification.Name("com.pokemon.mood.success"),
                                        object: nil,
                                        userInfo: moodResponse)
    }
}

#Preview {
    ContentView(pokemon: Pikachu(name: "Pikachu", trainer: "Julia"))
}
