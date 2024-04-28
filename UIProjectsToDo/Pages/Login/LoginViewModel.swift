//
//  LoginViewModel.swift
//  UIProjectsToDo
//
//  Created by batuhan on 1.04.2024.
//

import Foundation
import Firebase
final class LoginViewModel : ObservableObject {
    @Published var email    = ""
    @Published var password = ""
    @Published var onErrorMessage  = ""
    @Published var onError = false
    @Published var isPermission = false
    
    func isCorrect(){
        guard !email.isEmpty && email.contains(".") && email.contains("@") && !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                !password.isEmpty && password.count >= 6
        else { 
            onErrorMessage = "Email veya şifreyi eksik ve/veya yanlış girdiniz."
            onError = true
            return
        }
        onError = false
        onErrorMessage = ""
    }
    
    func signIn()  {
        Task {
            do {
                try await AuthManager.shared.signIn(withEmail: email, password: password)
                isPermission = true
            }catch{
                isPermission = false
                onErrorMessage = "Giriş yapılırken hata oluştu."
            }
            
        }
    }
    
    func updatePassword(){
        
        
        Auth.auth().currentUser?.updatePassword(to: password) { error in
          // ...
        }
    }

}
