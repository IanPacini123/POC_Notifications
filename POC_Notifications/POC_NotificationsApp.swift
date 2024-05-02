//
//  POC_NotificationsApp.swift
//  POC_Notifications
//
//  Created by Ian Pacini on 29/04/24.
//

import SwiftUI

@main
struct POC_NotificationsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(pokemon: Pikachu(name: "Pikachu", trainer: "Julia"))
        }
    }
}
