import Foundation
import FirebaseDatabase
 /*
  
  MVC MVVM
class DatabaseValues : ObservableObject {
    
    var ref = Database.database().reference()
    
    @Published
    var value: String? = nil
    
    @Published
    var object : [String : Any] ?= nil
*/
  /*
    func readValue(){
        ref.child("test").observeSingleEvent(of: .value) { snapshot in
            self.value = snapshot.value as? String ?? "Load failed"
        }
    }
*/
/*
    func observeDataChange(){
        ref.child("test").observe(.value { snapshot in
            self.value = snapshot.value as? String ?? "Load failed"
            
        }
        
    }
*/
/*
    func readObject(){
        ref.child("test").observeSingleEvent(of: .value) { snapshot in
            self.object = try snapshot.data(as: [String : Any])
        }
    }
}
*/
/*
class somethingImTired : ObservableObject {
    
    var ref = Database.database().reference().child("test")
    
    @Published
    var humidityValue : String? = nil
    
    func getValuesFromDB() -> String {
        ref.observe(.value) { with: {snapshot in
            self.value = snapshot.value as? String ?? "Load Failed"

        /*if let dictionary = snapshot.value as? [String : Any] {
            self.humidityValue = dictionary["humidity"] as! String*/
            // let tankStatus = dictionary["tank"] as! String
            }
        }
        })

    }
}

*/

