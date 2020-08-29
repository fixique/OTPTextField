//
//  Copyright © 2019 Surf. All rights reserved.
//
// swiftlint:disable unused_setter_value

import UIKit

/// This base class implement two protocols for custom text input view
/// It is necessary for implementation sms OTP Code auto fill and other abilities
/// Every method from this class should be overrided by child class
public class BaseInputView: UIView, UITextInput {

    // MARK: - UIKeyInput

    public var hasText: Bool {
        return false
    }

    public func insertText(_ text: String) {
    }

    public func deleteBackward() {
    }

    // MARK: - UITextInput

    public var selectedTextRange: UITextRange? {
        get {
            return nil
        }
        set(selectedTextRange) {
        }
    }

    public var markedTextRange: UITextRange? {
        return nil
    }

    public var markedTextStyle: [NSAttributedString.Key: Any]? {
        get {
            return nil
        }
        set(markedTextStyle) {
        }
    }

    public var beginningOfDocument: UITextPosition {
        return UITextPosition()
    }

    public var endOfDocument: UITextPosition {
        return UITextPosition()
    }

    public var inputDelegate: UITextInputDelegate? {
        get {
            return nil
        }
        set(inputDelegate) {
        }
    }

    public var tokenizer: UITextInputTokenizer {
        return self
    }

    public func replace(_ range: UITextRange, withText text: String) {
    }

    public func setMarkedText(_ markedText: String?, selectedRange: NSRange) {
    }

    public func unmarkText() {
    }

    public func textRange(from fromPosition: UITextPosition, to toPosition: UITextPosition) -> UITextRange? {
        return nil
    }

    public func position(from position: UITextPosition, offset: Int) -> UITextPosition? {
        return nil
    }

    public func position(from position: UITextPosition, in direction: UITextLayoutDirection, offset: Int) -> UITextPosition? {
        return nil
    }

    public func compare(_ position: UITextPosition, to other: UITextPosition) -> ComparisonResult {
        return .orderedAscending
    }

    public func offset(from: UITextPosition, to toPosition: UITextPosition) -> Int {
        return 0
    }

    public func position(within range: UITextRange, farthestIn direction: UITextLayoutDirection) -> UITextPosition? {
        return nil
    }

    public func characterRange(byExtending position: UITextPosition, in direction: UITextLayoutDirection) -> UITextRange? {
        return nil
    }

    public func baseWritingDirection(for position: UITextPosition, in direction: UITextStorageDirection) -> NSWritingDirection {
        return .leftToRight
    }

    public func setBaseWritingDirection(_ writingDirection: NSWritingDirection, for range: UITextRange) {
    }

    public func firstRect(for range: UITextRange) -> CGRect {
        return .zero
    }

    public func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }

    public func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }

    public func closestPosition(to point: CGPoint) -> UITextPosition? {
        return nil
    }

    public func closestPosition(to point: CGPoint, within range: UITextRange) -> UITextPosition? {
        return nil
    }

    public func characterRange(at point: CGPoint) -> UITextRange? {
        return nil
    }

    public func text(in range: UITextRange) -> String? {
        return nil
    }

}

// MARK: - UITextInputTokenizer

extension BaseInputView: UITextInputTokenizer {

    public func rangeEnclosingPosition(_ position: UITextPosition, with granularity: UITextGranularity, inDirection direction: UITextDirection) -> UITextRange? {
        return nil
    }

    public func isPosition(_ position: UITextPosition, atBoundary granularity: UITextGranularity, inDirection direction: UITextDirection) -> Bool {
        return true
    }

    public func position(from position: UITextPosition, toBoundary granularity: UITextGranularity, inDirection direction: UITextDirection) -> UITextPosition? {
        return nil
    }

    public func isPosition(_ position: UITextPosition, withinTextUnit granularity: UITextGranularity, inDirection direction: UITextDirection) -> Bool {
        return true
    }

}
