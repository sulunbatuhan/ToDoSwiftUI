//
//  MainTabView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel = MainViewModel()
    var selectedTab = 0
    
    var body: some View {
        if viewModel.isSignedIn,!viewModel.currentUserid.isEmpty {
            tabView
        }else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var tabView: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Main", systemImage:  "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
    
    
   
}

#Preview {
    MainTabView()
}
