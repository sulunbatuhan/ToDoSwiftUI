//
//  MainViewModel.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import Foundation
import Firebase


final class MainViewModel : ObservableObject {
    
    @Published var currentUserid : String = ""
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self ] auth, user in
            DispatchQueue.main.async {
                self?.currentUserid = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
}
