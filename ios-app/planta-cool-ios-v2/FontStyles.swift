import Foundation
import SwiftUI

extension Font {
    
    static var headerTitle: Font {
        return Font.custom("FoundersGroteskCond-SmBd", size: 20)
    }
    
    static var headerName: Font {
        return Font.custom("FoundersGrotesk-Semibold", size: 72)
    }

    static var valueTitle: Font {
        return Font.custom("FoundersGroteskCond-Bold", size: 20)
    }
    
    static var valueLabel: Font {
        return Font.custom("FoundersGrotesk-Semibold", size: 47)
    }
    
    static var buttonLabel: Font {
        return Font.custom("FoundersGrotesk-Bold", size: 47)
    }
}
