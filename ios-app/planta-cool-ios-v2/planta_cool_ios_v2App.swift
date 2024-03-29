import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()
    
    return true
  }
}


@main
struct planta_cool_ios_v2App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {

        WindowGroup {   
            ContentView()
            
            
        }
    }
    
    private let decoder = JSONDecoder()
    
}
