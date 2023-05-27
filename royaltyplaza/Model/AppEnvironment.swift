//
//  AppEnvironment.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import SwiftUI

class AppEnvironment: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var path = NavigationPath()
    
    @Published var user = User(name: "Tester", email: "")
    
    @Published var loyalties: [Loyalty] = [
        Loyalty(
            id: 1,
            store: "Test",
            photo: "https://i.pravatar.cc/150?img=32",
            points: 10, foregroundColor: "#fffcfc",
            backgroundColor: "#0b421a",
            createdAt: ""
        )
    ]
    
    @Published var selectedLoyalty: Loyalty = Loyalty(
        id: 1,
        store: "Test",
        photo: "https://i.pravatar.cc/150?img=32",
        points: 10, foregroundColor: "#fffcfc",
        backgroundColor: "#0b421a",
        createdAt: ""
    )
    
    @Published var currentCoupon: [Coupon] = [
        Coupon(
            id: 1, code: "123456789012345",
            title: "Test",
            description: "Hello",
            createdAt: "Hello",
            redeemedAt: "Hello")
    ]
    
    var token: String = ""
    
    func pushTo(_ to: Routes) -> Void {
        path.append(to)
    }
    
    func popBack() -> Void {
        path.removeLast()
    }
    
}
