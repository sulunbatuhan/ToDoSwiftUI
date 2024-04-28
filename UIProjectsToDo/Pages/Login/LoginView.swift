//
//  LoginView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .center){
                Form {
                    if !viewModel.onErrorMessage.isEmpty{
                        Text(viewModel.onErrorMessage)
                            .foregroundStyle(.red)
                            .animation(.easeInOut)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $viewModel.password)
                        .autocorrectionDisabled()
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                .frame(height: 150)
                .offset(y:50)
                    ButtonView(title: "Giriş Yap", color: .orange) {
                        viewModel.isCorrect()
                        if viewModel.onError == false {
                            viewModel.signIn()
                        }
                    }.padding(.top,50)
                    .fullScreenCover(isPresented: $viewModel.isPermission, content: {
                        MainTabView()
                    })
                    
                    .alert("\(viewModel.onErrorMessage)", isPresented: $viewModel.onError) {
                        
                    }
                
               Spacer()
            
                //MARK: Footer
                HStack {
                    Text("Don't have an account?")
                    NavigationLink("Sign Up") {
                        RegisterView()
                    }
                }
                .padding(.bottom,20)
            }
          
        }
    }
}

#Preview {
    LoginView()
}
