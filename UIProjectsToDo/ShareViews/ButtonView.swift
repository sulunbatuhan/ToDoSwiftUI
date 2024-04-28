//
//  ButtonView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import SwiftUI

struct ButtonView: View {
    let title  : String
    let color  : Color
    let action : () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(color)
                    
                HStack{
                    Text(title)
                        .foregroundStyle(.white)
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.white)
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            
        })
    }
}

#Preview {
    ButtonView(title: "Kayıt ol", color: .red) {
        
    }
}
