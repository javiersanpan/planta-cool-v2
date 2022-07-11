import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func regar(_ sender: UIButton) {
        database.child("test").updateChildValues(["regar": 1 as Int])
    }
    
}

