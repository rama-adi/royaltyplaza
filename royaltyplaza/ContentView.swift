//
//  ContentView.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var appEnv: AppEnvironment
    var body: some View {
        VStack {
            //Text("Nigger")
        }.onAppear {
            appEnv.pushTo(Routes.onboarding)
        }
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
