//
//  Pikachu.swift
//  POC_Notifications
//
//  Created by Ian Pacini on 29/04/24.
//

import SwiftUI

@Observable
class Pikachu {
    
    var name: String?
    var trainer: String?
    var mood: Mood
    
    init(name: String = "Pikachu", trainer: String? = "Selvagem") {
        self.name = name
        self.trainer = trainer
        self.mood = .neutral
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(receivedAtention),
                                               name: NSNotification.Name ("com.pokemon.mood.success"),
                                               object: nil)
        
    }
    
    @objc func receivedAtention(_ notification: Notification) {
        if let mood = notification.userInfo?["pokemonMood"] {
            self.mood = mood as? Mood ?? .sad
        }
    }
    
}

enum Mood: String {
    case happy, sad, neutral
}
