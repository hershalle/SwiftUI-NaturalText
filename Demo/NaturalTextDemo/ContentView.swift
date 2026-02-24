import NaturalText
import SwiftUI

struct ContentView: View {
    private let samples: [(String, String)] = [
        ("Hebrew", "שלום"),
        ("English", "Hello"),
        ("Arabic", "مرحبا"),
        ("Persian", "سلام"),
        ("Digits + Hebrew", "1שלום"),
        ("Punctuation + English", "...Hello"),
        ("Emoji + Arabic", "🙂مرحبا"),
    ]

    private let multilineSample = """
        שלום עולם
        Hello World
        مرحبا بالعالم
        """

    private let longHebrewSample = "שלום עולם, זהו טקסט ארוך בעברית שאמור לגלוש לשורה הבאה כדי לבדוק את היישור של שורות מרובות"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                sideBySide
                multilineDemo
                naturalList
            }
            .padding(20)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("NaturalText Demo")
                .font(.largeTitle.bold())
            Text("Alignment is based on the first strong directional character in the string.")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var sideBySide: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Side-by-side: Text vs NaturalText")
                .font(.title2.bold())

            HStack(alignment: .top, spacing: 16) {
                demoColumn(title: "Text", usesNaturalText: false)
                demoColumn(title: "NaturalText", usesNaturalText: true)
            }
        }
    }

    private var multilineDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Multiline: Text vs NaturalText")
                .font(.title2.bold())
            Text("Each line has a different direction — does the alignment work per-line?")
                .foregroundStyle(.secondary)

            Text("Long wrapping Hebrew")
                .font(.subheadline.bold())
            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Text")
                        .font(.headline)
                    Text(longHebrewSample)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(uiColor: .secondarySystemBackground))
                        )
                }
                .frame(maxWidth: .infinity)

                VStack(alignment: .leading, spacing: 6) {
                    Text("NaturalText")
                        .font(.headline)
                    NaturalText(longHebrewSample)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(uiColor: .secondarySystemBackground))
                        )
                }
                .frame(maxWidth: .infinity)
            }

            Text("Mixed direction lines")
                .font(.subheadline.bold())
            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Text")
                        .font(.headline)
                    Text(multilineSample)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(uiColor: .secondarySystemBackground))
                        )
                }
                .frame(maxWidth: .infinity)

                VStack(alignment: .leading, spacing: 6) {
                    Text("NaturalText")
                        .font(.headline)
                    NaturalText(multilineSample)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(uiColor: .secondarySystemBackground))
                        )
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var naturalList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Mixed Content")
                .font(.title2.bold())

            VStack(alignment: .leading, spacing: 10) {
                ForEach(samples, id: \.0) { label, text in
                    HStack(spacing: 12) {
                        Text(label)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(width: 130, alignment: .leading)
                        NaturalText(text)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(uiColor: .secondarySystemBackground))
                    )
                }
            }
        }
    }

    @ViewBuilder
    private func demoColumn(title: String, usesNaturalText: Bool) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)

            ForEach(samples, id: \.0) { label, text in
                VStack(alignment: .leading, spacing: 6) {
                    Text(label)
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    if usesNaturalText {
                        NaturalText(text)
                            .padding(.vertical, 6)
                    } else {
                        Text(text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 6)
                    }
                }
                .padding(12)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(uiColor: .secondarySystemBackground))
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
}
