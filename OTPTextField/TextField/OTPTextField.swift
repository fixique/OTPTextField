//
//  OTPTextField.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

/// Class for create custom OTPTextField with ability for enter otp characters and callback when otp enter
public final class OTPTextField: BaseInputView {

    // MARK: - Public Properties

    public var onBeginEditing: (() -> Void)?
    public var onTextChanged: ((String?) -> Void)?
    public var onEndEditing: (() -> Void)?
    public var onOTPEnter: ((String) -> Void)?

    override public var inputView: UIView? {
        get { return innerInputView }
        set { innerInputView = newValue }
    }

    override public var inputAccessoryView: UIView? {
        get { return innerInputAccessoryView }
        set { innerInputAccessoryView = newValue }
    }

    override public var canBecomeFirstResponder: Bool {
        return true
    }

    // MARK: - Private Properties

    private var configuration: OTPFieldConfiguration = OTPFieldConfiguration(adapter: DefaultTextFieldAdapter()) {
        didSet {
            updateUI()
        }
    }
    private var keyboardType: UIKeyboardType = .numberPad
    private var keyboardAppearance: UIKeyboardAppearance = .light
    private var autocorrectionType: UITextAutocorrectionType = .no
    private var allowedCharactersSet: CharacterSet = .alphanumerics
    private var isInputEnabled: Bool = true

    private var innerInputView: UIView?
    private var innerInputAccessoryView: UIView?
    private var charactersCount: Int {
        return configuration.adapter.numberOfPins()
    }
    private var pinViews: [PinContainer] = []
    private var text: String?
    private var currentCharactersCount: Int {
        return text?.count ?? 0
    }
    private var isError = false

    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateUI()
    }

    // MARK: - UIView

    override public func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        configureInputPinViews()
    }

    @discardableResult
    override public func becomeFirstResponder() -> Bool {
        onBeginEditing?()
        manageIndicatorOnBecomeResponder()
        return super.becomeFirstResponder()
    }

    @discardableResult
    override public func resignFirstResponder() -> Bool {
        onEndEditing?()
        if !isError {
            pinViews.forEach { $0.removeIndicator() }
        }
        return super.resignFirstResponder()
    }

    // MARK: - BaseInputView

    override public var hasText: Bool {
        return text?.isEmpty == false
    }

    override public func insertText(_ character: String) {
        insertCharacters(character)
    }

    override public func deleteBackward() {
        guard hasText, isInputEnabled else {
            return
        }
        pinViews[safe: currentCharactersCount - 1]?.clear()
        pinViews[safe: currentCharactersCount - 1]?.animateIndicator()
        pinViews[safe: currentCharactersCount]?.removeIndicator()
        text?.removeLast()
        notifyIfTextChanged()
    }

    // MARK: - Touches

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        guard bounds.contains(location) else {
            return
        }
        becomeFirstResponder()
    }

    // MARK: - Public Methods

    /// Method will set configuration for field and update field appearance
    public func setConfiguration(_ configuration: OTPFieldConfiguration) {
        self.configuration = configuration
    }

    /// Method will disable input by keyboard and setText method
    public func setEnabled(_ enabled: Bool) {
        isInputEnabled = enabled
    }

    /// Method will set text by one character per pin view
    public func setText(_ text: String) {
        insertCharacters(text)
    }

    /// Method will affect all pin views and set error state
    public func setError() {
        isError = true
        pinViews.forEach { $0.setError() }
    }

    /// Method will affect all pin views and remove state
    public func removeError() {
        guard isError else {
            return
        }
        isError = false
        pinViews.filter { $0.view != pinViews[safe: currentCharactersCount]?.view }.forEach { $0.removeError() }
    }

    /// Method will clear text field
    public func clear() {
        text = nil
        notifyIfTextChanged()
        updateUI()
    }

}

// MARK: - Configuration

private extension OTPTextField {

    /// Method rebuild all pinField views
    func updateUI() {
        applyConfiguraion()
        loadPinViews()
        configureInputPinViews()
    }

    /// Method apply current configuration for viewl
    func applyConfiguraion() {
        keyboardType = configuration.keyboardType
        keyboardAppearance = configuration.keyboardAppearance
        autocorrectionType = configuration.autocorrectionType
        allowedCharactersSet = configuration.allowedCharactersSet
    }

    /// Method remove from superview old instance of pinviews and reload all pins with new configuration
    func loadPinViews() {
        pinViews.forEach { $0.view.removeFromSuperview() }
        pinViews.removeAll()
        for index in 0..<charactersCount {
            let pinView = configuration.adapter.otpTextField(viewAt: index)
            pinViews.append(pinView)
        }
    }

    /// Method will add and position new views
    func configureInputPinViews() {
        var xPinPosition: CGFloat = 0
        for (index, item) in pinViews.enumerated() {
            let size = configuration.adapter.otpTextField(sizeForViewAt: index)
            item.view.frame = CGRect(x: xPinPosition, y: 0, width: size.width, height: size.height)
            addSubview(item.view)
            xPinPosition += size.width + configuration.adapter.otpTextField(spaceForViewAt: index)
        }
    }

}

// MARK: - Help Methods

private extension OTPTextField {

    /// Method return true, if character fits current lenght, character set and input is enabled
    func canInsertCharacter(_ character: String) -> Bool {
        let newText = text.map { $0 + character } ?? character
        let isCharacterMatchingSet = character.trimmingCharacters(in: allowedCharactersSet).isEmpty
        let isCorrectLength = newText.count <= charactersCount
        return !character.isEmpty && isCharacterMatchingSet && isCorrectLength && isInputEnabled
    }

    /// Method check if we can insert characters
    /// if more than one character will fill all pins
    /// if one character will set in first empty pin view
    func insertCharacters(_ characters: String) {
        guard canInsertCharacter(characters) else {
            return
        }
        if characters.count > 1 {
            pinViews.forEach { $0.removeIndicator() }
            for (index, char) in characters.enumerated() {
                pinViews[safe: index]?.set(value: String(char))
            }
            text = characters
        } else {
            text = text.map { $0 + characters } ?? characters
            pinViews[safe: currentCharactersCount - 1]?.removeIndicator()
            pinViews[safe: currentCharactersCount - 1]?.set(value: characters)
            pinViews[safe: currentCharactersCount]?.animateIndicator()
        }
        notifyIfTextChanged()
    }

    /// Method will triggered if all pins filled
    func notifyIfTextChanged() {
        onTextChanged?(text)
        guard currentCharactersCount == charactersCount else {
            return
        }
        onOTPEnter?(text ?? "")
    }

    /// Method will animate indicator on current empty pin view
    func manageIndicatorOnBecomeResponder() {
        guard let text = text else {
            pinViews[safe: 0]?.animateIndicator()
            return
        }
        pinViews[safe: text.count]?.animateIndicator()
    }

}
