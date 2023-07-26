//
//  MapView.swift
//  Africa
//
//  Created by Matteo Buompastore on 25/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - PROPERTIES
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        //MARK: - Basic Map
        Map(coordinateRegion: $region, annotationItems: locations) { parkLocation in
            // (A) PIN: Old style, always static
            //MapPin(coordinate: parkLocation.location, tint: .accentColor)
            
            // (B) MARKER: New style, always static
            //MapMarker(coordinate: parkLocation.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION: Can be interactive
//            MapAnnotation(coordinate: parkLocation.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32)
//            }//: ANNOTATION
            
            // (D) CUSTOM ADVANCED ANNOTATION: Can be interactive
            MapAnnotation(coordinate: parkLocation.location) {
                MapAnnotationView(location: parkLocation)
            }
            
        }//: MAP
        .overlay(
            HStack(alignment: .center) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
                
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(), alignment: .top
        )
    }
}


//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewLayout(.sizeThatFits)
            //.padding()
    }
}
