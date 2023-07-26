//
//  GalleryView.swift
//  Africa
//
//  Created by Matteo Buompastore on 25/07/23.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
