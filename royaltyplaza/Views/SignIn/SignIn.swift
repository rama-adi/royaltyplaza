//
//  SignIn.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import SwiftUI

struct SignIn: View {
    
    @EnvironmentObject var appEnv: AppEnvironment
    @StateObject var viewModel: ViewModel = ViewModel()
    
    
    var body: some View {
        GeometryReader { geom in
            
            VStack(spacing: 30) {
                Text("Sign in")
                    .font(.system(size: 40, weight: .bold))
                    .frame(width:geom.size.width, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.title2)
                    TextField("email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                }
                .frame(width: geom.size.width, alignment: .leading)
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.title2)
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                }
                .frame(width: geom.size.width, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Login mode")
                        .font(.title2)
                    
                    
                    Picker("Login mode", selection: $viewModel.employeeMode) {
                        
                        Text("Customer").tag(false)
                        Text("Worker").tag(true)
                    }.pickerStyle(.segmented)
                    
                    
                }
                .frame(width: geom.size.width, alignment: .leading)
                
                Spacer()
                
                Button(action: {viewModel.login(appEnv: appEnv)}) {
                    if viewModel.loading {
                        ActivityIndicator()
                    } else {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .disabled(viewModel.loading)
                .padding()
            }
            .frame(width: geom.size.width, alignment: .leading)
            
            
            
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Failed to login"), message: Text("Cannot log you in. please make sure everything is correct!"), dismissButton: .default(Text("Got it!")))
        }
        .padding()
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
    
    
    struct SignIn_Previews: PreviewProvider {
        static var previews: some View {
            SignIn()
        }
    }
}
