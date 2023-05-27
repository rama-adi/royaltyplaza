//
//  Onboarding.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject var appEnv: AppEnvironment
    var body: some View {
        VStack {
            Image("giftcard")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
            
            Spacer()
            
            VStack(spacing: 10) {
                Text("Unclutter Your Wallet, Simplify Your Loyalty Experience!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("With our app, you can store all your loyalty cards digitally in one secure place.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Button("Sign in") {
                appEnv.pushTo(Routes.signIn)
            }
            .frame(width: 200)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Image("tcclogo")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(.top, 30)
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.all, 20)
        .padding(.top, 100)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
