//
//  GalleryView.swift
//  Africa
//
//  Created by Matteo Buompastore on 25/07/23.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: - PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal = "lion"
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //SIMPLE GRID DEFINITIION
//    let gridLayout : [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    //EFFICIENT GRID DEFINITIION
    //let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //DYNAMIC GRID LAYOOUT
    //@State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridColumns : Double = 3
    
    //MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    

    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: - GRID
            VStack(alignment: .center, spacing: 30) {
                
                //MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                //MARK: - SLIDER
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumns) { newValue in
                        withAnimation {
                            gridSwitch()
                        }
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                withAnimation {
                                    selectedAnimal = animal.image
                                }
                                haptics.impactOccurred()
                            }
                    }//: LOOP
                }//: GRID
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
            
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}


//MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
