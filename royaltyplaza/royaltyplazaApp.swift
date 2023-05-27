//
//  royaltyplazaApp.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import SwiftUI

@main
struct royaltyplazaApp: App {
    @ObservedObject var appEnv: AppEnvironment = AppEnvironment()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appEnv.path) {
                ContentView().navigationDestination(for: Routes.self) { route in
                    ViewFactory.viewForDestination(route)
                }
            }.environmentObject(appEnv)
        }
    }
}
