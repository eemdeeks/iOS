import SwiftUI

struct ContentView: View {
    var body: some View {
        let viewModel = KoreanViewModel(myAnswer: Model())
        return KoreanView(viewModel: viewModel)
    }
}
