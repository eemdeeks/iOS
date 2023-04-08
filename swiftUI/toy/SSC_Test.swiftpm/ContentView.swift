import SwiftUI

struct ContentView: View {
    var body: some View {
        let viewModel = KoreanViewModel(myAnswer: .story)
        return KoreanView(viewModel: viewModel)
    }
}
