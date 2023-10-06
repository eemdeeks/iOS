//import SwiftUI
//
//struct ContentView: View {
//    let randomImageUrlBase:String  = "https://source.unsplash.com/random/?"
//
//    @State var image: UIImage? = nil
//    @State var thumbnail: UIImage? = nil
//    @State var isLoading: Bool = false
//    @State var query: String = ""
//
//    private func loadRandomImage() {
//        let url = randomImageUrlBase + query
//        // dataTask(with:completionHandler:)로 데이터를 가져와서
//        
//        UIImage(data: <#T##Data#>)
//        // UIImage(data:)로 이미지를 만들고
//        // prepareThumbnail(of:completionHandler:) 로 썸네일을 만드세요
//    }
//    
//
//    var body: some View {
//        VStack {
//            Text("READY")
//                .frame(width: 100, height: 100)
//                .padding()
//            Text("baseball")
//                .padding()
//            Button {
//                
//            } label: {
//                HStack {
//                    Image(systemName: "square.and.arrow.down")
//                    Text("불러오기")
//                }
//                .padding()
//            }
//
//        }
//    }
//}

//import SwiftUI
//
//struct ContentView: View {
//    let randomImageUrlBase:String  = "https://source.unsplash.com/random/?"
//
//    @State var image: UIImage? = nil
//    @State var thumbnail: UIImage? = nil
//    @State var isLoading: Bool = false
//    @State var query: String = ""
//
//    private func loadRandomImage() {
//        let url = randomImageUrlBase + query
//        if let url = URL(string: url) {
//            let request = URLRequest(url: url)
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                guard let imageData = data else {
//                    return
//                }
//                guard let uiImage = UIImage(data: imageData) else { return }
//                self.image = uiImage
//                
//                uiImage.prepareThumbnail(of: CGSize(width: 100, height: 100)) { thumb in
//                    self.thumbnail = thumb
//                }
//            }
//            task.resume()
//        }
//        // dataTask(with:completionHandler:)로 데이터를 가져와서
//        // UIImage(data:)로 이미지를 만들고
//        // prepareThumbnail(of:completionHandler:) 로 썸네일을 만드세요
//    }
//
//    var body: some View {
//        VStack {
//            if let image = self.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .frame(width: 100, height: 100)
//            }
//            if let thumb = self.thumbnail {
//                Image(uiImage: thumb)
//                    .resizable()
//                    .frame(width: 100, height: 100)
//            }
//            Button {
//                self.loadRandomImage()
//            } label: {
//                Text("불러오기")
//            }
//
//        }
//    }
//}

import SwiftUI

struct ContentView: View {
    let randomImageUrlBase:String  = "https://source.unsplash.com/random/?"

    @State var image: UIImage? = nil
    @State var thumbnail: UIImage? = nil
    @State var isLoading: Bool = false
    @State var query: String = ""

    private func loadRandomImage() async {
        let url = randomImageUrlBase + query
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        guard let result = try? await URLSession.shared.data(for: request) else { return }
        let data = result.0
        let uiImage = UIImage(data: data)
        let thumb = await uiImage?.byPreparingThumbnail(ofSize: CGSize(width: 100, height: 100))
            
        // dataTask(with:completionHandler:)로 데이터를 가져와서
        // UIImage(data:)로 이미지를 만들고
        // prepareThumbnail(of:completionHandler:) 로 썸네일을 만드세요
    }

    var body: some View {
        VStack {
            if let image = self.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            if let thumb = self.thumbnail {
                Image(uiImage: thumb)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            Button {
                Task {
                    await self.loadRandomImage()
                }
            } label: {
                Text("불러오기")
            }

        }
    }
}
