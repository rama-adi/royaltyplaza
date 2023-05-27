//
//  WorkerHomepageViewModel.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 29/05/23.
//

import Foundation
import Combine

extension WorkerHomepage {
    class ViewModel: ObservableObject {
        @Published var qrScannerShown = false
        @Published var alertShown = false
        @Published var loading = false
        
        @Published var alertMessage = ""
        @Published var qrScannerMessage = ""
        
        private var cancellables = Set<AnyCancellable>()
        
        func openScanner() -> Void {
            self.qrScannerShown.toggle()
        }
        
        func claimCode(appEnv: AppEnvironment) -> Void {
            self.loading = true
            
            StoreAPI.redeemCoupon(code: self.qrScannerMessage, token: appEnv.token)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { _ in }, receiveValue: { value in
                    if value.success {
                        self.alertMessage = "Successfully redeemed the coupon"
                    } else {
                        self.alertMessage = "Failed to redeem coupon."
                    }
                })
                .store(in: &cancellables)
            
            self.alertShown = true
            self.loading = false
        }
        
        init() {}
    }
}
