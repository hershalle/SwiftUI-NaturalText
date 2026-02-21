import Foundation

extension Unicode.Scalar {
    fileprivate var isRTLScript: Bool {
        switch value {
        case 0x0590...0x05FF, // Hebrew
             0x0600...0x06FF, // Arabic
             0x0700...0x074F, // Syriac
             0x0750...0x077F, // Arabic Supplement
             0x0780...0x07BF, // Thaana
             0x07C0...0x07FF, // NKo
             0x0800...0x083F, // Samaritan
             0x0840...0x085F, // Mandaic
             0x08A0...0x08FF, // Arabic Extended-A
             0x1E900...0x1E95F, // Adlam
             0xFB50...0xFDFF, // Arabic Presentation Forms-A
             0xFE70...0xFEFF: // Arabic Presentation Forms-B
            return true
        default:
            return false
        }
    }

    var naturalTextIsRTLScript: Bool {
        isRTLScript
    }
}
