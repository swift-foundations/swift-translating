//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation
import Language
import Translated

extension TranslatedString {

  public var period: Self {
    self.map(\.period)
  }

  public var comma: Self {
    self.map(\.comma)
  }

  public var semicolon: Self {
    self.map(\.semicolon)
  }

  public var colon: Self {
    self.map(\.colon)
  }

  public var questionmark: Self {
    self.map(\.questionmark)
  }

  public var isEmpty: Bool {
    self.english.isEmpty && self.dutch.isEmpty
  }

  public var capitalized: Self {
    self.map(\.capitalized)
  }

  public func capitalized(with locale: Locale? = nil) -> Self {
    self.map { $0.capitalized(with: locale) }
  }

  public func uppercased(with locale: Locale? = nil) -> Self {
    self.map { $0.uppercased(with: locale) }
  }

  @available(*, deprecated, message: "Renamed to capitalizingFirstLetter()")
  public func capitalizedFirstLetter() -> Self {
    self.capitalizingFirstLetter()
  }

  public func capitalizingFirstLetter() -> Self {

    self.map { $0.prefix(1).capitalized + $0.dropFirst() }
  }

  public func firstLetter(_ closure: (String) -> String) -> Self {

    self.map { closure(String($0.prefix(1))) + $0.dropFirst() }

  }

  public func lowercased(with locale: Locale? = nil) -> Self {
    self.map { $0.lowercased(with: locale) }
  }
}

extension Translated<String> {
  public func slug() -> TranslatedString {
    self.map { $0.slug() }
  }
}
