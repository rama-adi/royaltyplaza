//
//  WorkerHomepage.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 29/05/23.
//

import SwiftUI
import CodeScanner

struct WorkerHomepage: View {
    
    @EnvironmentObject var appEnv: AppEnvironment
    @StateObject var viewModel: ViewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            Text("Your store")
                .font(.system(size: 40, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("More item coming soon because 🛌🏼. for now, scan the coupon!")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Button(action: {
                viewModel.openScanner()
            }) {
                HStack {
                    Image(systemName: "qrcode")
                        .foregroundColor(.white)
                    Text("Scan Coupon")
                        .foregroundColor(.white)
                        .padding()
                }
                .frame(width: 200)
                .background(Color.blue)
                .cornerRadius(10)
                
            }
            .disabled(viewModel.loading)
            .padding()
            
            Image("tcclogo")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(.top, 30)
            
            
        }
        .padding()
        .alert(isPresented: $viewModel.alertShown) {
            Alert(
                title: Text("Information"),
                message: Text(viewModel.alertMessage), dismissButton: .default(Text("Ok"))
            )
        }
        .sheet(
            isPresented: $viewModel.qrScannerShown,
            onDismiss: {
                viewModel.claimCode(appEnv: appEnv)
            }) {
                CodeScannerView(codeTypes: [.qr]) { response in
                    if case let .success(result) = response {
                        
                        viewModel.qrScannerMessage = result.string
                        viewModel.qrScannerShown = false
                        
                    }
                }
            }
            .overlay(viewModel.loading ? AnyView(OverlayableLoadingIndicator()) : AnyView(EmptyView()))
    }
    
}

struct WorkerHomepage_Previews: PreviewProvider {
    static var previews: some View {
        WorkerHomepage()
    }
}
