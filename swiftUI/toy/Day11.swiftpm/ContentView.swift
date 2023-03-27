import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(){
            VStack{
                HStack{
                    VStack{
                        Image("byo")
                            .resizable()
                            .frame(width: 100,height: 100)
                        Text("byo")
                            .font(.title)
                    }
                    HStack{
                        Image("ddan")
                            .resizable()
                            .frame(width: 100,height: 100)
                        Text("ddan")
                            .font(.title)
                    }
                }
                HStack{
                    Image("theo")
                        .resizable()
                        .frame(width: 100,height: 100)
                    Text("theo")
                        .font(.title)
                }
                NavigationLink{
                    SecondView()
                    
                }
            }
        }
    }
}
