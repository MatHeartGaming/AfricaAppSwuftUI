//
//  VideoListView.swift
//  Africa
//
//  Created by Matteo Buompastore on 25/07/23.
//

import SwiftUI

struct VideoListView: View {
    
    //MARK: - PROPERTIES
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    let hapticImact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }//: LOOP
            }//: LIST
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // SHUFFLE VIDEOS
                        withAnimation(.spring(response: 0.8, dampingFraction: 0.4)) {
                            videos.shuffle()
                            hapticImact.impactOccurred()
                        }
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }//: BUTTON

                }//: TOOLBAR_ITEM
            }
        }//: NAVIGATION
    }
}


//MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
