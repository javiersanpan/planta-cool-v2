import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    // Set firebase database
    private let database = Database.database().reference()
    // Label variables
    @IBOutlet weak var humidityPercentLabel: UILabel!
    @IBOutlet weak var tankStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get data from firebase and assign to labels
        database.child("test").observe(.value, with: { snapshot in
            guard let dbTEST = snapshot.value as? [String: Any] else { return }
        
        // Set humidity percent from firebase value
            //var humidityValueFromDB: AnyObject
            //humidityValueFromDB = dbTEST["humidity"] as AnyObject
            self.humidityPercentLabel.text = "\(dbTEST["humidity"] as AnyObject)%"
            
        // Set tank status from firebase value
            //var tankStatusFromDB: AnyObject
            // tankStatusFromDB = dbTEST["tank"] as AnyObject
            self.tankStatusLabel.text = "\(dbTEST["tank"] as AnyObject)"
            
        })
    }

    @IBAction func regar(_ sender: UIButton) {
        database.child("test").updateChildValues(["regar": 1 as Int])
    }
    
}

