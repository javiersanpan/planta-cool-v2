import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    
    var body: some View {

        VStack {
            
            NavigationView {
                VStack{}
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("YOUR PLANTS")
                            .font(Font.headerTitle)
                    }
                }
                // This should be the plant ID
                .navigationTitle("PLANT001")
                
            }
            
            Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
