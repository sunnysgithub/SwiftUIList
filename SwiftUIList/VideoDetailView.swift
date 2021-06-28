import SwiftUI

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        VStack (spacing: 10){
            
            Spacer()
            
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(12)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
            
            HStack (alignment: .center, spacing: 50) {
                Label("\(video.viewCount)", systemImage:"eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(video.formattedUploadDate())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
            
            Text(video.description)
                .font(.body)
                .lineLimit(10)
                .padding()
            
            Spacer()
            
            Link(destination: video.url, label: {
                StandardButton(label:"Watch Now")
            }).padding()
        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: VideoList.topTen.first!)
    }
}

struct StandardButton: View {
    
    var label: String
    
    var body: some View {
        Text(label)
            .bold()
            .font(.title2)
            .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(.systemRed))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
