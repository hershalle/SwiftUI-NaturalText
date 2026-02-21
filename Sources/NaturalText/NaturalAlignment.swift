import SwiftUI

public extension View {
    /// Aligns the view to match the writing direction of the given text.
    /// - Parameter text: The string used to determine alignment direction.
    /// - Returns: A view aligned to the leading or trailing edge based on content.
    func naturalAlignment(for text: String) -> some View {
        frame(
            maxWidth: .infinity,
            alignment: text.naturalLayoutDirection == .rightToLeft ? .trailing : .leading
        )
    }
}
