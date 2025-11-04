//
//  File 2.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 24/11/2020.
//

import Foundation
import Language

extension [String] {

  public static let alphabet: Self = [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
    "t", "u", "v", "w", "x", "y", "z",
  ]

  public enum Separator: Sendable {
    case and
    case or
    case andOr

    public static let orSeparator: Self = .or
  }
}

extension TranslatedString {
  public init(_ separator: [String].Separator) {
    switch separator {
    case .and:
      self = [.english: "and"]  // TODO: Add proper localized "and" translations
    case .or:
      self = [.english: "or"]  // TODO: Add proper localized "or" translations
    case .andOr:
      self = [.english: "and/or"]  // TODO: Add proper localized "and/or" translations
    }
  }
}
