//
//  ViewFactory.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import SwiftUI

class ViewFactory {
    
    @ViewBuilder
    static func viewForDestination(_ destination: Routes) -> some View {
        switch destination {
        case .onboarding:
            Onboarding()
        case .signIn:
            SignIn()
        case .homepage:
            Homepage()
        case .customerStoreInfo:
            CustomerStoreInfo()
        case .workerHomepage:
            WorkerHomepage()
        }
    }
    
}
