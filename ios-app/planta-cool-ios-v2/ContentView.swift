import SwiftUI

struct ContentView: View {
    
    var body: some View {
        

        VStack {
            
            NavigationView {
                VStack{
                    
                    //let defaults = UserDefaults.standard
                
                        //getValuesFromDB {
                        //Label("Humedad \(defaults.string(forKey: "humidityKey"))", systemImage: "drop.fill").padding()
                    //}
                    
                    Label("Humedad", systemImage: "drop.fill").padding()
                }
                
                
                .toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        Text("YOUR PLANTS")
                            .font(Font.headerTitle)
                    }
                }
                
                // This should be the plant ID
                .navigationTitle("PLANT001")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
