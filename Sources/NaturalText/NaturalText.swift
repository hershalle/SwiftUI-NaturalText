import SwiftUI

/// A drop-in wrapper around `Text` that aligns based on the content's writing direction.
@frozen
public struct NaturalText: View {
    public let text: String
    public let configure: (Text) -> Text

    /// Creates a natural-aligned `Text` wrapper.
    /// - Parameters:
    ///   - text: The string to render.
    ///   - configure: A closure for applying `Text`-specific modifiers.
    public init(_ text: String, configure: @escaping (Text) -> Text = { $0 }) {
        self.text = text
        self.configure = configure
    }

    /// The content and behavior of this view.
    public var body: some View {
        let isRTL = text.naturalLayoutDirection == .rightToLeft
        configure(Text(text))
            .multilineTextAlignment(isRTL ? .trailing : .leading)
            .frame(
                maxWidth: .infinity,
                alignment: isRTL ? .trailing : .leading
            )
    }
}
