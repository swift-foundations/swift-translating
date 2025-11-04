//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 29/04/2022.
//

import Foundation
import Language
import Translated
import TranslatedString

/// A container for handling singular and plural forms of a value, with dynamic member lookup support.
///
/// `SinglePlural<A>` is designed to manage content that has different forms depending on quantity,
/// such as text that changes between singular and plural forms, or UI elements that adapt based on count.
///
/// ## Basic Usage
///
/// ```swift
/// let itemCount = SinglePlural(
///     single: "1 item",
///     plural: "multiple items"
/// )
///
/// let message = itemCount(.single)  // "1 item"
/// let message = itemCount(.plural)  // "multiple items"
/// ```
///
/// ## Dynamic Member Lookup
///
/// SinglePlural supports dynamic member lookup, allowing direct access to properties of the preferred variant:
///
/// ```swift
/// let strings = SinglePlural(
///     single: "Hello",
///     plural: "Hello all",
///     preferred: .single
/// )
///
/// let length = strings.count  // Accesses .single variant's count property
/// ```
///
/// ## With Translated Content
///
/// Particularly useful with TranslatedString for internationalized plural forms:
///
/// ```swift
/// let notification = SinglePlural(
///     single: TranslatedString(english: "1 new message", dutch: "1 nieuw bericht"),
///     plural: TranslatedString(english: "new messages", dutch: "nieuwe berichten")
/// )
/// ```
///
/// - Parameter A: The type of content being managed in singular/plural forms
@dynamicMemberLookup
public struct SinglePlural<A> {
  /// The singular form of the content
  public let single: A

  /// The plural form of the content
  public let plural: A

  /// The preferred variant to use when accessing via dynamic member lookup
  public var preferred: Variant

  /// Creates a SinglePlural instance with distinct singular and plural forms.
  ///
  /// - Parameters:
  ///   - single: The content to use for singular form
  ///   - plural: The content to use for plural form
  ///   - preferred: The default variant to use (defaults to .single)
  public init(
    single: A,
    plural: A,
    preferred: Variant = .single
  ) {
    self.single = single
    self.plural = plural
    self.preferred = preferred
  }
}

extension SinglePlural {

  /// Creates a SinglePlural instance using the same content for both singular and plural forms.
  ///
  /// Useful when the content doesn't change between singular and plural forms.
  ///
  /// - Parameters:
  ///   - all: The content to use for both forms
  ///   - preferred: The default variant to use (defaults to .single)
  public init(
    _ all: A,
    preferred: Variant = .single
  ) {
    self.single = all
    self.plural = all
    self.preferred = preferred
  }

  /// Creates a SinglePlural instance using a closure to generate content for each variant.
  ///
  /// The closure is called once for each variant (.single and .plural).
  ///
  /// - Parameters:
  ///   - preferred: The default variant to use (defaults to .single)
  ///   - all: A closure that receives a variant and returns the appropriate content
  public init(
    preferred: Variant = .single,
    _ all: (Variant) -> A
  ) {
    self.single = all(.single)
    self.plural = all(.plural)
    self.preferred = preferred
  }
}

extension SinglePlural {
  /// Returns the content for the currently preferred variant.
  public var preferredA: A {
    switch preferred {
    case .single: return single
    case .plural: return plural
    }
  }

  /// Dutch alias for the singular form ("enkelvoud")
  public var enkelvoud: A { single }

  /// Dutch alias for the plural form ("meervoud")
  public var meervoud: A { plural }

}

extension SinglePlural {
  /// Dynamic member lookup subscript that forwards property access to the preferred variant.
  ///
  /// This allows accessing properties of the wrapped content directly on the SinglePlural instance.
  /// The property is accessed on whichever variant is currently preferred.
  ///
  /// - Parameter keyPath: The key path to the property on the wrapped type
  /// - Returns: The value of the property from the preferred variant
  public subscript<T>(dynamicMember keyPath: KeyPath<A, T>) -> T {
    switch preferred {
    case .single: return single[keyPath: keyPath]
    case .plural: return plural[keyPath: keyPath]
    }
  }
}

extension SinglePlural {
  /// Represents whether content should be in singular or plural form.
  public enum Variant: String, Codable, Hashable, Sendable {
    /// Singular form (one item)
    case single
    /// Plural form (multiple items)
    case plural
  }
}

extension SinglePlural {
  /// Returns content for the specified variant, using preferred variant if none specified.
  ///
  /// - Parameter variant: The variant to retrieve, or nil to use the preferred variant
  /// - Returns: The content for the specified or preferred variant
  public func callAsFunction(with variant: Variant? = nil) -> A {
    callAsFunction(variant: variant)
  }

  /// Returns content for the specified variant, using preferred variant if none specified.
  ///
  /// - Parameter variant: The variant to retrieve, or nil to use the preferred variant
  /// - Returns: The content for the specified or preferred variant
  public func callAsFunction(in variant: Variant? = nil) -> A {
    callAsFunction(variant: variant)
  }

  /// Returns content for the specified variant, using preferred variant if none specified.
  ///
  /// - Parameter variant: The variant to retrieve, or nil to use the preferred variant
  /// - Returns: The content for the specified or preferred variant
  public func callAsFunction(for variant: Variant? = nil) -> A {
    callAsFunction(variant: variant)
  }

  /// Returns content for the specified variant, using preferred variant if none specified.
  ///
  /// - Parameter variant: The variant to retrieve, or nil to use the preferred variant
  /// - Returns: The content for the specified or preferred variant
  public func callAsFunction(_ variant: Variant? = nil) -> A {
    callAsFunction(variant: variant)
  }

  /// Returns content for the specified variant, using preferred variant if none specified.
  ///
  /// This is the main implementation method that all other call-as-function methods delegate to.
  ///
  /// - Parameter variant: The variant to retrieve, or nil to use the preferred variant
  /// - Returns: The content for the specified or preferred variant
  public func callAsFunction(variant: Variant? = nil) -> A {
    switch variant {
    case .none: return self.preferredA
    case .single: return self.single
    case .plural: return self.plural
    }
  }

}

extension SinglePlural {
  /// Transforms both variants using the provided function.
  ///
  /// Applies the transformation function to both the singular and plural forms,
  /// creating a new SinglePlural with the transformed values.
  ///
  /// - Parameter transform: A function that transforms values of type A to type B
  /// - Returns: A new SinglePlural<B> with both variants transformed
  public func map<B>(_ transform: (A) -> B) -> SinglePlural<B> {
    return SinglePlural<B>(single: transform(self.single), plural: transform(self.plural))
  }

  /// Transforms both variants using the provided function that returns SinglePlural instances.
  ///
  /// Applies the transformation function to both variants and flattens the result.
  /// The resulting SinglePlural takes the .single form from transforming the .single variant,
  /// and the .plural form from transforming the .plural variant.
  ///
  /// - Parameter transform: A function that transforms values of type A to SinglePlural<B>
  /// - Returns: A flattened SinglePlural<B> with variants from the transformed results
  public func flatMap<B>(_ transform: (A) -> SinglePlural<B>) -> SinglePlural<B> {
    return SinglePlural<B>(
      single: transform(self.single).single,
      plural: transform(self.plural).plural
    )
  }
}

extension SinglePlural: Equatable where A: Equatable {}
extension SinglePlural: Hashable where A: Hashable {}
extension SinglePlural: Codable where A: Codable {}
extension SinglePlural: Sendable where A: Sendable {}

extension SinglePlural<TranslatedString> {
  public static let empty: Self = .init(single: "", plural: "")
}
