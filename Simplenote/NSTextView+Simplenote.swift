import Foundation


// MARK: - Simplenote API
//
extension NSTextView {

    /// Returns the line (range, string) at the current selected range
    ///
    func lineAtSelectedRange() -> (NSRange, String) {
        string.asNSString.line(at: selectedRange.location)
    }

    /// Indents the List at the selected range (if any)
    ///
    @objc
    func processTabInsertion() -> Bool {
        let (lineRange, lineString) = lineAtSelectedRange()

        guard let _ = lineString.rangeOfListMarker else {
            return false
        }

        // Inject a Tab character at the beginning of the line
        let insertionRange = NSRange(location: lineRange.location, length: .zero)
        insertText(String.tab, replacementRange: insertionRange)

        return true
    }

    /// Processes a Newline Insertion on List Items:
    ///
    ///     -   No List Marker: in the current line, this method does nothing.
    ///     -   SelectedRange.location < List Marker.location: NSTextView is expected to just insert a \n
    ///     -   If the Line has *only* the List Marker, we'll nuke it
    ///     -   Otherwise: We'll add a newline, with the same Marker indentation and padding!
    ///
    @objc
    func processNewlineInsertion() -> Bool {
        let (lineRange, lineString) = lineAtSelectedRange()

        // No Marker, no processing!
        guard let rangeOfMarker = lineString.rangeOfListMarker else {
            return false
        }

        // Avoid inserting a *new* Marker when the caret isn't on the right hand side of the current one
        let locationOfMarkerInText = lineRange.location + rangeOfMarker.location
        guard selectedRange.location > locationOfMarkerInText else {
            return false
        }

        // Empty Line: Remove the bullet
        let trimmedString = lineString.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedString.utf16.count != rangeOfMarker.length else {
            removeText(at: lineRange)
            return true
        }

        // Insert: newline + Padding + Marker + Space?
        let prefixAndMarkerRange = NSRange(location: lineRange.location, length: rangeOfMarker.upperBound)
        let prefixAndMarkerString = attributedString().attributedSubstring(from: prefixAndMarkerRange)
        let text = NSMutableAttributedString()

        text.append(string: .newline)
        text.append(prefixAndMarkerString)

        if let character = lineString.unicodeScalar(at: rangeOfMarker.upperBound), character.isWhitespace {
            text.append(string: String(character))
        }

        insertText(text, replacementRange: selectedRange)

        return true
    }

    /// Remove the text at the specified range, and notifies the delegate.
    ///
    func removeText(at range: NSRange) {
        insertText(String(), replacementRange: range)
    }
}
