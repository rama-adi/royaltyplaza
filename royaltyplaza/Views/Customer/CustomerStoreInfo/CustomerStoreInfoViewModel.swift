//
//  CustomerStoreInfoViewModel.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 29/05/23.
//

import Foundation

extension CustomerStoreInfo {
    class ViewModel: ObservableObject {
        
        @Published var openSheet: Bool = false
        @Published var selectedCoupon: Coupon?
        
        init() {}
    }
}
