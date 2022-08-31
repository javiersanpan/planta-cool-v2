import Foundation
import FirebaseDatabase

func getValuesFromDB(onSuccess : @escaping () -> Void) {
    let ref = Database.database().reference().child("test")
    let defaults = UserDefaults.standard
    
    ref.observe(.value, with: {(snapshot) in
        
        if let dictionary = snapshot.value as? [String : Any] {
            let humidity = dictionary["humidity"] as! String
            let tankStatus = dictionary["tank"] as! String
            
            defaults.set(humidity, forKey: "humidityKey")
            defaults.set(tankStatus, forKey: "tankKey")
            
            onSuccess()
        }
    })
}
