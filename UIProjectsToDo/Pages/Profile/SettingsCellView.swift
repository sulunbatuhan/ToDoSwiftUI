//
//  SettingsCellView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 2.04.2024.
//

import SwiftUI

struct SettingsCellView: View {
    let title     : String
    let imageName : String
    let tintColor : Color
    let action    : ()->Void

    var body: some View {
        Button {
        action()
        } label: {
            HStack(spacing:14){
                Image(systemName:imageName)
                    .imageScale(.small)
                    .font(.title)
                    .foregroundStyle(tintColor)
                
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
            }
        }
    }
}
#Preview {
    SettingsCellView(title: "Version", imageName: "gear", tintColor: Color.gray){
        
    }
}
