import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            
            List(videos){ video in
                
                NavigationLink(
                    destination: VideoDetailView(video: video),
                    label: {
                        VideoCell(video: video)
                    })
                
            }
            .navigationTitle("Top 10 Videos")
        }
    }
}

struct VideoCell: View {
    
    var video: Video
    
    var body: some View {
        HStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .padding(.vertical, 4)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
                Text(video.formattedUploadDate())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
