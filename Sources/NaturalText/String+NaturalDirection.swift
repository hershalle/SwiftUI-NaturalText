import SwiftUI

public extension String {
    /// Returns the layout direction based on the first strong directional character.
    ///
    /// The scan skips digits, punctuation, symbols, and whitespace. If no strong directional
    /// character is found, `.leftToRight` is returned.
    var naturalLayoutDirection: LayoutDirection {
        for scalar in unicodeScalars {
            let category = scalar.properties.generalCategory
            switch category {
            case .uppercaseLetter, .lowercaseLetter, .otherLetter:
                return scalar.naturalTextIsRTLScript ? .rightToLeft : .leftToRight
            default:
                continue
            }
        }

        return .leftToRight
    }
}
