//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation
import Translating

public extension TranslatedString {
    static let male: Self =
        .init(
            dutch: "man",
            english: "male",
            french: "mâle",
            german: "Mann",
            spanish: "masculino"
        )
    
    static let female: Self =
        .init(
            dutch: "vrouw",
            english: "female",
            french: "femme",
            german: "Frau",
            spanish: "femenina"
        )
    
    static let non_binary: Self =
        .init(
            dutch: "non-binair",
            english: "non binary",
            french: "non binaire",
            german: "nicht binär",
            spanish: "no binario"
        )
    
    static let answer: Self =
        .init(
            dutch: "antwoord",
            english: "answer",
            french: "répondre",
            german: "antwort",
            spanish: "respuesta"
        )
    
    static let agree: Self =
        .init(
            dutch: "eens",
            english: "agree",
            french: "convenu",
            german: "stimmt",
            spanish: "acordado"
        )
    
    static let disagree: Self =
        .init(
            dutch: "oneens",
            english: "disagree",
            french: "désaccord",
            german: "nein",
            spanish: "discrepar"
        )
    
    static let compact: Self =
        .init(
            dutch: "compact",
            english: "compact",
            french: "compact",
            german: "kompakt",
            spanish: "compacto"
        )
    
    static let complete: Self =
        .init(
            dutch: "compleet",
            english: "complete",
            french: "complet",
            german: "vollständig",
            spanish: "completo"
        )
    
    static let your_name: Self =
        .init(
            dutch: "je naam",
            english: "your name",
            french: "votre nom",
            german: "Ihren Namen",
            spanish: "Su nombre"
        )
    
    static let your_gender: Self =
        .init(
            dutch: "je geslacht",
            english: "your gender",
            french: "votre sexe",
            german: "dein Geschlecht",
            spanish: "tu género"
        )
    
    static let select_an_option: Self =
        .init(
            dutch: "selecteer een keuze",
            english: "select an option",
            french: "choisir une option",
            german: "Wähle eine Option",
            spanish: "Seleccione una opción"
        )
    
    static let gender: Self =
        .init(
            dutch: "gender",
            english: "gender",
            french: "genre",
            german: "Geschlecht",
            spanish: "género"
        )
    
    static let new: Self =
        .init(
            dutch: "Nieuw",
            english: "New",
            french: "Nouveau",
            german: "Neue",
            spanish: "Nuevo"
        )
    
    static let language: Self =
        .init(
            dutch: "taal",
            english: "language",
            french: "langue",
            german: "sprache",
            spanish: "idioma"
        )
    
    static let next: Self =
        .init(
            dutch: "volgende",
            english: "next"
        )
    
    static let subject: Self =
        .init(
            dutch: "onderwerp",
            english: "subject"
        )
    
    static let date: Self =
        .init(
            dutch: "datum",
            english: "date"
        )
    
    static let name: Self =
        .init(
            dutch: "naam",
            english: "name"
        )
    
    static let `continue`: Self =
        .init(
            dutch: "doorgaan",
            english: "continue"
        )
    
    static let `true`: Self =
        .init(
            dutch: "waar",
            english: "true"
        )
    
    static let `false`: Self =
        .init(
            dutch: "onwaar",
            english: "false"
        )
    
    static let and: Self =
        .init(
            dutch: "en",
            english: "and",
            french: "et",
            german: "und",
            italian: "e",
            spanish: "y"
        )
    
    static let or: Self =
        .init(
            dutch: "of",
            english: "or",
            french: "ou",
            german: "oder",
            italian: "o",
            spanish: "o"
        )
    
    static let title: Self =
        .init(
            dutch: "Titel",
            english: "Title",
            french: "Titre",
            german: "Titel",
            spanish: "Título"
        )
    
    static let delete: Self =
        .init(
            dutch: "verwijder",
            english: "delete",
            french: "supprimer",
            german: "löschen",
            spanish: "borrar"
        )
    
    static let done: Self =
        .init(
            dutch: "klaar",
            english: "done",
            french: "fini",
            german: "fertig",
            spanish: "finalizado"
        )
    
    static let edit: Self =
        .init(
            dutch: "wijzig",
            english: "edit"
        )
    
    static let in_progress: Self =
        .init(
            dutch: "bezig",
            english: "in progress",
            french: "fini",
            german: "im Gange",
            spanish: "en curso"
        )
    
    static let reset: Self =
        .init(
            dutch: "Reset",
            english: "Reset",
            french: "Reset",
            german: "Reset",
            spanish: "Reset"
        )
    
    static let random: Self =
        .init(
            dutch: "andom",
            english: "random",
            french: "random",
            german: "random",
            spanish: "random"
        )
    
    static let cancel: Self =
        .init(
            dutch: "annuleer",
            english: "cancel",
            french: "annuler",
            german: "stornieren",
            spanish: "cancelar"
        )
    
    static let allow_changes: Self =
        .init(
            dutch: "sta wijzigingen toe",
            english: "allow changes",
            french: "autoriser les modifications",
            german: "Änderungen zulassen",
            spanish: "permitir cambios"
        )
    
    static let choose_true_or_false: Self =
        .init(
            dutch: "Kies waar of onwaar",
            english: "Choose true or false"
        )
    
    static let cannot_undo: Self =
        .init(
            dutch: "je kunt dit niet ongedaan maken",
            english: "you cannot undo this action",
            french: "vous ne pouvez pas annuler cette action",
            german: "Sie können diese Aktion nicht rückgängig machen",
            spanish: "no puedes deshacer esta acción"
        )
    
    static let text_color: Self =
        .init(
            dutch: "tekstkleur",
            english: "text color",
            french: "couleur du texte",
            german: "textfarbe",
            spanish: "color de texto"
        )
    
    static let background_color: Self =
        .init(
            dutch: "achtergrondkleur",
            english: "background color",
            french: "la couleur d'arrière-plan",
            german: "hintergrundfarbe",
            spanish: "color de fondo"
        )
    
    var any: Self {
        .init(
            dutch: "een \(dutch)",
            english: {
                if let first = english.first {
                    if Set<String>.vowels.contains(String(first).lowercased()) {
                        return "an \(english)"
                    } else {
                        return "a \(english)"
                    }
                }
                return english
            }()
        )
    }

    var the: Self {
        .init(
            dutch: "de \(dutch)",
            english: "the \(english)"
        )
    }
}
