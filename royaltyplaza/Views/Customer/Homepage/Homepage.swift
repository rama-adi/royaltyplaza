//
//  Homepage.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import SwiftUI
import Colorful

struct Homepage: View {
    
    @EnvironmentObject var appEnv: AppEnvironment
    @StateObject var viewModel: ViewModel = ViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading, spacing: 20) {
                Text("Dashboard")
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    ColorfulView(
                        animated: true,
                        animation:  Animation
                            .interpolatingSpring(stiffness: 50, damping: 1)
                            .speed(0.2),
                        colors: appEnv.loyalties.compactMap { Color(hex: $0.backgroundColor)
                                .desaturate(by:30)
                                .lighten(by: 70)
                            
                        },
                        colorCount: 100
                    )
                    
                    
                    VStack(alignment: .leading) {
                        
                        Spacer()
                        
                        Text("\(appEnv.user.name)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("\(appEnv.loyalties.count) Loyalties")
                            .font(.title2)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .frame(height: 200)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.2), lineWidth: 2))
                
                
                Text("Your loyalties")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVStack {
                    ForEach(appEnv.loyalties) { loyalty in
                        VStack(alignment:.leading) {
                            
                            HStack {
                                Spacer()
                                AsyncImage(url: URL(string: loyalty.photo)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 64, height: 64)
                                .cornerRadius(5)
                            }
                            
                            Spacer()
                            
                            
                            Text(loyalty.store)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(hex: loyalty.foregroundColor))
                            Text("\(loyalty.points) Points")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color(hex: loyalty.foregroundColor))
                        }
                        .padding()
                        .frame(height: 150)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(hex: loyalty.backgroundColor))
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.getCoupons(
                                appEnv: appEnv, store: loyalty)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
        .overlay(viewModel.loading ? AnyView(OverlayableLoadingIndicator()) : AnyView(EmptyView()))
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
            .environmentObject(AppEnvironment())
    }
}
