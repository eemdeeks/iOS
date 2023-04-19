import SwiftUI

struct ContentView: View {
    var body: some View {
        KoreanListView(viewModel: KoreanListViewModel(modelList: Model.modelList), viewModel2: EnglishListViewModel(modelList: Model.modelList2))
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.portrait)
    }
}
