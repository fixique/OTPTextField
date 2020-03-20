// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Errors {
    /// Correct password
    internal static let correctPassword = L10n.tr("Localizable", "Errors.correctPassword")
    /// Incorrect password
    internal static let iccorectPassword = L10n.tr("Localizable", "Errors.iccorectPassword")
  }

  internal enum Main {
    /// Examples
    internal static let title = L10n.tr("Localizable", "Main.Title")
  }

  internal enum OTPFieldType {
    internal enum Custom {
      /// Custom input field
      internal static let description = L10n.tr("Localizable", "OTPFieldType.Custom.description")
      /// Custom input field
      internal static let title = L10n.tr("Localizable", "OTPFieldType.Custom.title")
    }
    internal enum Default {
      /// This is an example of a default input field. An error state has been added to it. Correct password %@
      internal static func description(_ p1: String) -> String {
        return L10n.tr("Localizable", "OTPFieldType.Default.description", p1)
      }
      /// Default input field
      internal static let title = L10n.tr("Localizable", "OTPFieldType.Default.title")
    }
    internal enum Round {
      /// Round input field
      internal static let description = L10n.tr("Localizable", "OTPFieldType.Round.description")
      /// Round input field
      internal static let title = L10n.tr("Localizable", "OTPFieldType.Round.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
