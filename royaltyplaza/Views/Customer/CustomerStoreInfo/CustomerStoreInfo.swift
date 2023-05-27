//
//  CustomerStoreInfo.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import SwiftUI

struct CustomerStoreInfo: View {
    @EnvironmentObject var appEnv: AppEnvironment
    @StateObject var viewModel: ViewModel = ViewModel()
    
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                
                VStack(alignment:.leading) {
                    
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: appEnv.selectedLoyalty.photo)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 64, height: 64)
                        .cornerRadius(5)
                    }
                    
                    Spacer()
                    
                    
                    Text(appEnv.selectedLoyalty.store)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: appEnv.selectedLoyalty.foregroundColor))
                    Text("\(appEnv.selectedLoyalty.points) Points")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(hex: appEnv.selectedLoyalty.foregroundColor))
                }
                .padding()
                .frame(height: 200)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(hex: appEnv.selectedLoyalty.backgroundColor))
                .cornerRadius(10)
                
                Text("Your coupons")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVStack {
                    ForEach(appEnv.currentCoupon) { coupon in
                        HStack(spacing: 5) {
                            Image(systemName: "tag.slash")
                            Text(coupon.title)
                            Spacer()
                            
                            if coupon.redeemedAt != nil {
                                Text("Invalid")
                                    .foregroundColor(.red)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.selectedCoupon = coupon
                            viewModel.openSheet.toggle()
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(appEnv.selectedLoyalty.store)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .sheet(isPresented: $viewModel.openSheet) {
            CustomerCouponViewSheet(coupon: $viewModel.selectedCoupon)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .padding(.top, 30)
        .background(Color.gray.opacity(0.1))
        
    }
}

struct CustomerStoreInfo_Previews: PreviewProvider {
    static var previews: some View {
        CustomerStoreInfo().environmentObject(AppEnvironment())
    }
}
