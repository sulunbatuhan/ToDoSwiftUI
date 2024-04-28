//
//  RegisterView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    
    var body: some View {
        VStack{
            Form{
                if !viewModel.onError{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                        .bold()
                }
                TextField("Email", text: $viewModel.email)
                    .autocorrectionDisabled()
                    
                SecureField("Password", text: $viewModel.password)
                    .autocorrectionDisabled()
                
                Button("Kayıt ol") {
                    viewModel.isCorrect()
                }
            }
            
            //MARK: Footer
            
        }
    }
}

#Preview {
    RegisterView()
}
