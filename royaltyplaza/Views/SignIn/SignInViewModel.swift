//
//  SignInViewModel.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation
import SwiftUI
import Combine

extension SignIn {
    class ViewModel: ObservableObject {
        
        
        
        @Published var email = ""
        @Published var password = ""
        
        @Published var employeeMode = false
        @Published var loading = false
        @Published var hasError = false
        
        
        private var cancellables = Set<AnyCancellable>()
        
        func login(appEnv: AppEnvironment) -> Void {
            if employeeMode {
                loginEmployee(appEnv: appEnv)
            } else {
                loginCustomer(appEnv: appEnv)
            }
        }
        
        // MARK:  - Login Employee
        private func loginEmployee(appEnv: AppEnvironment) {
            self.loading = true
            
            UserAPI.login(email: email, password: password, employeeMode: employeeMode)
                .flatMap { api in
                    let token = api.data["access_token"].stringValue
                    appEnv.token = token
                    
                    // MARK: - Combine the get working store and user data to downstream
                    return Publishers.Zip(
                        StoreAPI.getWorkingStore(token: token),
                        UserAPI.userData(token: token)
                    )
                }
            // MARK: - We need to listen in the main dispatchqueue so that swiftui knows to refresh the state
                .receive(on: DispatchQueue.main)
            
            // MARK: - Subscribe to the completion event
                .sink(receiveCompletion: { [weak self] completion in
                    self?.loading = false
                    switch completion {
                    case .failure:
                        self?.hasError.toggle()
                    case .finished:
                        appEnv.pushTo(.workerHomepage)
                    }
                }, receiveValue: { stores, userData in
                    
                    appEnv.user = userData.data
                    
                    
                })
                .store(in: &cancellables)
        }
        
        // MARK: - Login Customer
        private func loginCustomer(appEnv: AppEnvironment) {
            self.loading = true
            UserAPI.login(email: email, password: password, employeeMode: employeeMode)
                .flatMap { api in
                    let token = api.data["access_token"].stringValue
                    appEnv.token = token
                    
                    // MARK: - Combine the get loyalty and user data to downstream
                    return Publishers.Zip(
                        LoyaltyAPI.getLoyalties(token: token),
                        UserAPI.userData(token: token)
                    )
                }
            // MARK: - We need to listen in the main dispatchqueue so that swiftui knows to refresh the state
                .receive(on: DispatchQueue.main)
            
            // MARK: - Subscribe to the completion event
                .sink(receiveCompletion: { [weak self] completion in
                    self?.loading = false
                    switch completion {
                    case .failure:
                        self?.hasError.toggle()
                    case .finished:
                        appEnv.pushTo(.homepage)
                    }
                }, receiveValue: { loyalties, userData in
                    
                    appEnv.loyalties = loyalties.data
                    appEnv.user = userData.data
                    
                    
                })
                .store(in: &cancellables)
        }
        
        init() {}
    }
}
