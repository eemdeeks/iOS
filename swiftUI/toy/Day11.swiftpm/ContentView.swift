import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationView(){
            VStack{
                HStack{
                    Text("🌞")
                    Toggle(isOn: $isDarkMode){
                    }
                    Text("🌑")
                }
                Spacer()
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
                Spacer()
                HStack{
                    
                    
                    NavigationLink{
                        SecondView()
                        
                    } label: {
                        Image("NextButton")
                            .resizable()
                            .frame(width: 100, height: 100)
                            
                    }
                    
                }
                
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .padding()
        }
    }
}
