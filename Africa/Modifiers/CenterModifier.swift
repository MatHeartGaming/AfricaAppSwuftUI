//
//  CenterModifier.swift
//  Africa
//
//  Created by Matteo Buompastore on 26/07/23.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    
    func body(content : Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
            
    }
    
}
