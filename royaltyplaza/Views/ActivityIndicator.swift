//
//  ActivityIndicator.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import SwiftUI

struct ActivityIndicator: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .padding()
                .onAppear {
                    isAnimating = true
                }
                .onDisappear {
                    isAnimating = false
                }
        }
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
    }
}
