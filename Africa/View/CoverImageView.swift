//
//  CoverImageVire.swift
//  Africa
//
//  Created by Matteo Buompastore on 25/07/23.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - PROPERTIES
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFit()
            }//: LOOP
        }//: TAB
        .tabViewStyle(.page)
    }
}


//MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
