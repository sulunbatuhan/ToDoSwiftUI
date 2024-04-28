//
//  HeaderView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 6.04.2024.
//

import Foundation
import SwiftUI


struct HeaderView : View {
    
    
    var body : some View {
        HStack{
            RoundedRectangle(cornerRadius: 15)
                .clipShape(Circle())
                .foregroundStyle(.red)
                .frame(height: 90)
//                .border(.blue)
        }
    }
    
}


#Preview{
    HeaderView()
}
