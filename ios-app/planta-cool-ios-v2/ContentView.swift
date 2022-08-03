import SwiftUI

struct ContentView: View {
    
    init() {
        for fontFamily in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: fontFamily) {
                print("-- \(font)")
            }
        }
    }
    
    var body: some View {
        Text("hola")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
