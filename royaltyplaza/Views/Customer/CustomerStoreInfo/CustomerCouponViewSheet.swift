//
//  CustomerCouponViewSheet.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 29/05/23.
//

import SwiftUI
import QRCode

struct CustomerCouponViewSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var coupon: Coupon?
    
    var body: some View {
        VStack(spacing: 50) {
            
            
            QRCodeViewUI(
                content: coupon?.code ?? "1_INVALID",
                pixelStyle: QRCode.PixelShape.RoundedPath(cornerRadiusFraction: 0.7, hasInnerCorners: true),
                eyeStyle: QRCode.EyeShape.RoundedRect()
            ).frame(width: 200, height: 200)
            
            ScrollView {
                VStack(spacing: 30) {
                    VStack {
                        Text("Coupon Name:")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(coupon?.title ?? "")")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack {
                        Text("Coupon information:")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(coupon?.description ?? "")")
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .frame(maxHeight: .infinity)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: .infinity)
            
            Spacer()
            
            if coupon!.redeemedAt != nil {
                
                HStack {
                    Spacer()
                    Text("Coupon is expired / redeemed.\nIt will not work")
                        .padding()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .background(.red)
                .cornerRadius(10)
                
               
            }
            
            Button("Close") {
                dismiss()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        
    }
}

struct CustomerCouponViewSheet_Previews: PreviewProvider {
    static var previews: some View {
        CustomerCouponViewSheet(coupon: .constant(        Coupon(
            id: 1, code: "123456789012345",
            title: "Test",
            description: "Hello",
            createdAt: "Hello",
            redeemedAt: "Hello")
        ))
    }
}
