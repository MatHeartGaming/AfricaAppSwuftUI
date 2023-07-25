//
//  ContentView.swift
//  Africa
//
//  Created by Matteo Buompastore on 25/07/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 270)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink {
                        AnimalDetailView(animal: animal)
                    } label: {
                        AnimalListItemView(animal: animal)
                    }//: LINK
                }//: LOOP
            }//: LIST
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }//: NAVIGATION
    }
}


//MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
