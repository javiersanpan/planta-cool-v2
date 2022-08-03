import SwiftUI

struct ContentView: View {
    
    var body: some View {

        NavigationView{
            VStack{
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("YOUR PLANTS")
                        .font(Font.headerTitle)
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
