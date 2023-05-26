//
//  OverlayableLoadingIndicator.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 29/05/23.
//

import Foundation
import SwiftUI

struct OverlayableLoadingIndicator: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2)
                    .frame(width: 100, height: 100)
            }
            .background(.thickMaterial)
            .cornerRadius(20)
            Spacer()
        }
    }
}
