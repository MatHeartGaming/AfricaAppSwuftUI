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
    
    @State private var isGridViewActive = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns : Int = 1
    @State private var toolbarIcon = "rectangle.grid.1x2"
    //let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    //MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: (gridLayout.count % 3) + 1)
        gridColumns = gridLayout.count
        print("Grid Columns: \(gridColumns)")
        
        //TOOLBAR ICON CHANGE
        switch gridColumns {
            case 1: toolbarIcon = "rectangle.grid.1x2"
                
            case 2:
                toolbarIcon = "rectangle.grid.2x2"
                
            case 3:
                toolbarIcon = "square.grid.3x2"
                
            default: toolbarIcon = "rectangle.grid.1x2"
        }
    }
    
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 270)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                        
                        // MARK: 1° way to Center the Credits
                        /*HStack(alignment: .center) {
                            CreditsView()
                        }
                        .frame(maxWidth: .infinity)*/
                        
                        // MARK: 2° way to Center the Credits
                        CreditsView()
                            .modifier(CenterModifier())
                        
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                } //: LINK
                            } //: LOOP
                        } //: GRID
                        .padding()
                        .animation(.easeIn, value: isGridViewActive)
                    } //: SCROLL
                } //: CONDITION
            } //: GROUP
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            print("List View")
                            withAnimation {
                                isGridViewActive = false
                            }
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }//: BUTTON
                        
                        Button {
                            print("Grid View")
                            withAnimation {
                                if(isGridViewActive) {
                                    gridSwitch()
                                }
                                isGridViewActive = true
                            }
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }//: BUTTON
                        
                    } //: HSTACK
                }
            } //: TOOLBAR
        } //: NAVIGATION
    }
}


//MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
