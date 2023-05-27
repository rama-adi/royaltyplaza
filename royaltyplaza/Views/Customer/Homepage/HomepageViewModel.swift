//
//  HomepageViewModel.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 29/05/23.
//

import Foundation
import Combine

extension Homepage {
    class ViewModel: ObservableObject {
        @Published var loading: Bool = false
        
        private var cancellables = Set<AnyCancellable>()
        func getCoupons(appEnv: AppEnvironment, store: Loyalty) -> Void {
            self.loading = true
            LoyaltyAPI.getCoupons(
                loyaltyId: store.id,
                token: appEnv.token
            )
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                   debugPrint("Failed")
                case .finished:
                    print("Finished")
                    self.loading = false
                    appEnv.pushTo(.customerStoreInfo)
                }
            }, receiveValue: { coupon in
                appEnv.currentCoupon = coupon.data
                appEnv.selectedLoyalty = store
            })
            .store(in: &cancellables)
        }
    }
}
