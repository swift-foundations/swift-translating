//
//  File 2.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 24/11/2020.
//

import Foundation
import Language


public extension [String] {
    
    static let alphabet: Self = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]
    
    enum Separator {
        case and
        case or
        case andOr
        
        public static let orSeparator: Self = .or
    }
}
public extension [String] {
    func joined(separator: TranslatedString) -> TranslatedString {

        TranslatedString(
            arabic: self.joined(separator: separator(.arabic)),
            bengali: self.joined(separator: separator(.bengali)),
            chinese: self.joined(separator: separator(.chinese)),
            danish: self.joined(separator: separator(.danish)),
            dutch: self.joined(separator: separator(.dutch)),
            english: self.joined(separator: separator(.english)),
            french: self.joined(separator: separator(.french)),
            german: self.joined(separator: separator(.german)),
//            hindi: self.joined(separator: separator(.hindi)),
            indonesian: self.joined(separator: separator(.indonesian)),
//            irish: self.joined(separator: separator(.irish)),
//            italian: self.joined(separator: separator(.italian)),
//            japanese: self.joined(separator: separator(.japanese)),
//            javanese: self.joined(separator: separator(.javanese)),
//            korean: self.joined(separator: separator(.korean)),
//            polish: self.joined(separator: separator(.polish)),
//            portuguese: self.joined(separator: separator(.portuguese)),
//            romanian: self.joined(separator: separator(.romanian)),
//            russian: self.joined(separator: separator(.russian)),
//            slovak: self.joined(separator: separator(.slovak)),
//            slovenian: self.joined(separator: separator(.slovenian)),
            spanish: self.joined(separator: separator(.spanish))
//            swedish: self.joined(separator: separator(.swedish)),
//            turkish: self.joined(separator: separator(.turkish))
        )
    }

    func joined(separator: Separator) -> TranslatedString {

        switch self.count {
        case ...0: return ""
        case 1: return .init(self.first!)
        case 2:
            switch separator {
            case .and:
                return .init(
                    dutch: "\(self.first ?? "") en \(self[1])",
                    english: "\(self.first ?? "") and \(self[1])"
                )
            case .or:
                return .init(
                    dutch: "\(self.first ?? "") of \(self[1])",
                    english: "\(self.first ?? "") or \(self[1])"
                )
            case .andOr:
                return .init(
                    dutch: "\(self.first ?? "") en/of \(self[1])",
                    english: "\(self.first ?? "") and/or \(self[1])"
                )
            }
        case 2...:
            let last = self.last!
            //            let x = self[0...self.count - 1]
            let rest = self.dropLast()

            switch separator {
            case .and: return
                    .init(
                        dutch: rest.joined(separator: ", ") + ", en " + "\(last)",
                        english: rest.joined(separator: ", ") + ", and " + "\(last)"
                    )
            case .or: return
                    .init(
                        dutch: rest.joined(separator: ", ") + ", of " + "\(last)",
                        english: rest.joined(separator: ", ") + ", or " + "\(last)"
                    )
            case .andOr: return
                    .init(
                        dutch: rest.joined(separator: ", ") + ", en/of " + "\(last)",
                        english: rest.joined(separator: ", ") + ", and/or " + "\(last)"
                    )
            }
        default: fatalError()
        }
    }
}

public extension Array where Element == TranslatedString {
    func joined(separator: Array<String>.Separator) -> TranslatedString {
        return .init(
            dutch: self.map(\.dutch).joined(separator: separator).dutch,
            english: self.map(\.english).joined(separator: separator).english
        )
    }

    func joined(separator: String) -> TranslatedString {
        return .init(
            dutch: self.map(\.dutch).joined(separator: separator),
            english: self.map(\.english).joined(separator: separator)
        )
    }
}

public extension [String] {
    func joined(language: Language, separator: Array<String>.Separator) -> String {
        self.map { TranslatedString($0) }.joined(separator: separator)(language)
    }
}

public extension String {
    static func mockPersonName() -> Self {
        String.mockFirstName() + " " + .mockSurname()
    }

    static func mockDutchPhone() -> Self {
        "+316\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))"
    }

}

public extension String {
    static func mockFirstName() -> Self { mockVoornaam() }
    static func mockVoornaam() -> Self { [String].voornamen.randomElement()! }

    static func mockSurname() -> Self { mockAchternaam() }
    static func mockAchternaam() -> Self { [String].achternamen.randomElement()! }
}

public extension Array where Element == String {

    static let voornamenMeisjes: Self = [
        "Aafje", "Aafke", "Aagje", "Aaltje", "Abigaïl", "Ada", "Adelheid", "Adelinde", "Adriana", "Afke", "Afra", "Agatha", "Akke", "Albertina", "Albertine", "Aleida", "Aletta", "Alev", "Alexandra", "Alexia", "Alice", "Alicia", "Alida", "Alie", "Amalia", "Amanda", "Amber", "Amy", "Andrea", "Angela", "Angelica", "Angelique", "Aniek", "Anita", "Anja", "Anke", "Anna", "Annabel", "Anne", "Anneke", "Annelies", "Annemarie", "Annemiek", "Annemieke", "Annet", "Annette", "Annie", "Anniek", "Annigje", "Annika", "Anouk", "Antje", "Antoinette", "Antonia", "Arianne", "Arlette", "Asha", "Ashley", "Astrid", "Audrey", "Aukje", "Aurore", "Babette", "Barbara", "Baukje", "Beatrix", "Beau", "Beertje", "Belinda", "Belle", "Bente", "Bernadette", "Bertha", "Bianca", "Bieke", "Birgit", "Bo", "Boukje", "Bregje", "Brenda", "Brigitte", "Britt", "Cadence", "Carina", "Carla", "Carlijn", "Carmen", "Caro", "Carola", "Carolien", "Caroline", "Catharina", "Catherine", "Cecile", "Cecilia", "Céline", "Celine", "Chantal", "Charissa", "Charlotte", "Cheyenne", "Chiara", "Chloé", "Christa", "Christel", "Christianne", "Christina", "Christine", "Cindy", "Claire", "Clara", "Claudia", "Cora", "Corina", "Corine", "Cornelia", "Cynthia", "Dagmar", "Daisy", "Dana", "Daniëlle", "Danique", "Daphne", "Darya", "Debbie", "Debora", "Deborah", "Demi", "Denise", "Desirée", "Devi", "Dewi", "Diana", "Diane", "Dieuwertje", "Dieuwke", "Dina", "Dionne", "Dirkje", "Doetje", "Dominique", "Donna", "Dora", "Dorien", "Dorothea", "Dymfna", "Edith", "Eefje", "Elena", "Eleonora", "Eline", "Elisabeth", "Elise", "Elize", "Elja", "Ella", "Ellen", "Elly", "Els", "Elvira", "Emilia", "Emilie", "Emily", "Emma", "Emmy", "Erica", "Erika", "Erin", "Erna", "Esmée", "Esmeralda", "Ester", "Esther", "Eva", "Evelien", "Eveline", "Evi", "Famke", "Fanny", "Fatima", "Fay", "Felicia", "Felicity", "Femke", "Fenna", "Fenne", "Fien", "Fiene", "Fiona", "Fiorella", "Fleur", "Floor", "Florence", "Francesca", "Francine", "Francis", "Frederika", "Frederike", "Frederique", "Froukje", "Gabriëlle", "Gea", "Geertje", "Geertrui", "Geertruida", "Geesje", "Geeske", "Gemma", "Georgina", "Geraldine", "Gerda", "Gerrie", "Gerry", "Gertrude", "Ghislaine", "Gina", "Gisela", "Godelieve", "Grada", "Greetje", "Greta", "Gretha", "Grietje", "Guusje", "Gwen", "Hadewig", "Hanna", "Hannah", "Hanneke", "Harmina", "Harmke", "Hayley", "Hedwig", "Heidi", "Heiltje", "Heintje", "Heleen", "Helen", "Helena", "Helène", "Helga", "Hendrika", "Hennie", "Henny", "Henrieke", "Henriëtte", "Hermien", "Hester", "Hetty", "Hilary", "Hilda", "Hilde", "Hildegard", "Hine", "Hope", "Hubertina", "Ida", "Ilana", "Ilja", "Ilona", "Ilonka", "Ilse", "Imke", "Ina", "Indiana", "Indy", "Ine", "Ineke", "Inez", "Inge", "Ingeborg", "Ingrid", "Irene", "Iris", "Irma", "Isa", "Isabel", "Isabella", "Isabelle", "Isis", "Ivonne", "Jacoba", "Jacqueline", "Jade", "Jane", "Janne", "Janneke", "Jannie", "Janny", "Jansje", "Jantine", "Jasmijn", "Jeanette", "Jeanine", "Jeanne", "Jeannette", "Jeanny", "Jennifer", "Jenny", "Jessica", "Jessie", "Jet", "Jetske", "Jette", "Jitske", "Joanna", "Joëlle", "Johanna", "Joke", "Jolanda", "Jolande", "Jolie", "Jolien", "Jolijn", "Jonne", "José", "Josefien", "Josephine", "Josine", "Joy", "Joyce", "Judith", "Julia", "Juliana", "Julie", "Juliette", "Karen", "Karin", "Karina", "Karlijn", "Katja", "Katrijn", "Kayla", "Kaylee", "Kayleigh", "Kelly", "Kendra", "Kensi", "Kiki", "Kim", "Kimberley", "Kimberly", "Kira", "Kirsten", "Kitty", "Klaasje", "Krista", "Kristel", "Kyra", "Laetitia", "Lara", "Larissa", "Laura", "Lauren", "Laurentien", "Leentje", "Lena", "Lenie", "Leonie", "Leonora", "Leontine", "Letitia", "Lianne", "Lidwina", "Lieke", "Lien", "Liesbeth", "Lieve", "Lilian", "Linda", "Linde", "Lindsay", "Lindsey", "Lisa", "Lisanne", "Lisette", "Lizzy", "Loes", "Lois", "Lola", "Lonneke", "Lotte", "Louisa", "Louise", "Lucia", "Luna", "Lydia", "Lyke", "Lynn", "Maaike", "Maartje", "Madeleine", "Madelief", "Mae", "Magdalena", "Maike", "Mandy", "Manon", "Manuela", "Mara", "Marcella", "Marcia", "Mare", "Marga", "Margaret", "Margo", "Margot", "Margriet", "Maria", "Marian", "Marianna", "Marianne", "Marie", "Marieke", "Mariëlle", "Mariëtte", "Marije", "Marijke", "Marijn", "Marike", "Marina", "Marion", "Mariska", "Marissa", "Marit", "Marja", "Marjan", "Marjolein", "Marjolijn", "Marleen", "Marlene", "Marlies", "Marloes", "Martha", "Marthe", "Martina", "Martine", "Mathilde", "Maud", "Maureen", "Maxime", "Maya", "Mayke", "Megan", "Meike", "Melanie", "Melissa", "Mercedes", "Merel", "Meta", "Mette", "Mia", "Michelle", "Mieke", "Mila", "Milena", "Milou", "Mina", "Minke", "Mira", "Miranda", "Mireille", "Miriam", "Mirjam", "Mirte", "Mirthe", "Monica", "Moniek", "Monique", "Myrthe", "Nadia", "Nadine", "Nancy", "Naomi", "Natalie", "Natasja", "Nathalie", "Neeltje", "Nele", "Nelleke", "Nellie", "Nelly", "Nicky", "Nicole", "Nienke", "Nikita", "Nina", "Noa", "Noëlla", "Noor", "Noortje", "Nora", "Nova", "Nynke", "Odilia", "Olga", "Olivia", "Pamela", "Patricia", "Patty", "Pascalle", "PaulaPaulien", "Pauline", "Petra", "Petronella", "Pia", "Pien", "Pieternel", "Pietertje", "Pleun", "Priscilla", "Puck", "Quinty", "Quirine", "Rachel", "Rachelle", "Ramona", "Rani", "Rebecca", "Regina", "Reina", "Renata", "Renate", "Renée", "Rens", "Renske", "Ria", "Rianne", "Rita", "Robin", "Romy", "Roos", "Rosa", "Rosalie", "Rosanne", "Rowena", "Roxanne", "Ruby", "Ruth", "Sabina", "Sabine", "Sabrina", "Sam", "Samantha", "Sandra", "Sandrine", "Sandy", "Sanna", "Sanne", "Sara", "Sarah", "Sascha", "Saskia", "Selena", "Selina", "Selma", "Senna", "Shannon", "Sharon", "Shirley", "Sietske", "Sigrid", "Silvana", "Silvia", "Simone", "Sjoerdtje", "Sjoukje", "Sofia", "Sofie", "Sonja", "Sophia", "Sophie", "Soraya", "Stefanie", "Stella", "Stephanie", "Sterre", "Susan", "Susanna", "Suzanna", "Suzanne", "Sylvia", "Sylvana", "Tamara", "Tanja", "Tara", "Tatjana", "Tess", "Tessa", "Thalia", "Thea", "Theodora", "Thérèse", "Theresia", "Tiffany", "Tine", "Tineke", "Tiny", "Tjitske", "Tonia", "Trijntje", "Ursula", "Valerie", "Vanessa", "Veerle", "Vera", "Veronica", "Veronique", "Victoria", "Virginia", "Vivian", "Wanda", "Welmoed", "Wendy", "Wies", "Wietske", "Wilhelmina", "Willeke", "Willemien", "Willemijn", "Willie", "Willy", "Wilma", "Xandra", "Yara", "Yasmin", "Yasmine", "Yentl", "Ymke", "Yolanda", "Yvette", "Yvonne", "Ziva", "Zoë", "Zwaantje"
    ]

    static let voornamen: Self = voornamenJongens + voornamenMeisjes

    static let voornamenJongens: Self = [
        "Aafje", "Aafke", "Aagje", "Aaltje", "Abigaïl", "Ada", "Adelheid", "Adelinde", "Adriana", "Afke", "Afra", "Agatha", "Akke", "Albertina", "Albertine", "Aleida", "Aletta", "Alev", "Alexandra", "Alexia", "Alice", "Alicia", "Alida", "Alie", "Amalia", "Amanda", "Amber", "Amy", "Andrea", "Angela", "Angelica", "Angelique", "Aniek", "Anita", "Anja", "Anke", "Anna", "Annabel", "Anne", "Anneke", "Annelies", "Annemarie", "Annemiek", "Annemieke", "Annet", "Annette", "Annie", "Anniek", "Annigje", "Annika", "Anouk", "Antje", "Antoinette", "Antonia", "Arianne", "Arlette", "Asha", "Ashley", "Astrid", "Audrey", "Aukje", "Aurore", "Babette", "Barbara", "Baukje", "Beatrix", "Beau", "Beertje", "Belinda", "Belle", "Bente", "Bernadette", "Bertha", "Bianca", "Bieke", "Birgit", "Bo", "Boukje", "Bregje", "Brenda", "Brigitte", "Britt", "Cadence", "Carina", "Carla", "Carlijn", "Carmen", "Caro", "Carola", "Carolien", "Caroline", "Catharina", "Catherine", "Cecile", "Cecilia", "Céline", "Celine", "Chantal", "Charissa", "Charlotte", "Cheyenne", "Chiara", "Chloé", "Christa", "Christel", "Christianne", "Christina", "Christine", "Cindy", "Claire", "Clara", "Claudia", "Cora", "Corina", "Corine", "Cornelia", "Cynthia", "Dagmar", "Daisy", "Dana", "Daniëlle", "Danique", "Daphne", "Darya", "Debbie", "Debora", "Deborah", "Demi", "Denise", "Desirée", "Devi", "Dewi", "Diana", "Diane", "Dieuwertje", "Dieuwke", "Dina", "Dionne", "Dirkje", "Doetje", "Dominique", "Donna", "Dora", "Dorien", "Dorothea", "Dymfna", "Edith", "Eefje", "Elena", "Eleonora", "Eline", "Elisabeth", "Elise", "Elize", "Elja", "Ella", "Ellen", "Elly", "Els", "Elvira", "Emilia", "Emilie", "Emily", "Emma", "Emmy", "Erica", "Erika", "Erin", "Erna", "Esmée", "Esmeralda", "Ester", "Esther", "Eva", "Evelien", "Eveline", "Evi", "Famke", "Fanny", "Fatima", "Fay", "Felicia", "Felicity", "Femke", "Fenna", "Fenne", "Fien", "Fiene", "Fiona", "Fiorella", "Fleur", "Floor", "Florence", "Francesca", "Francine", "Francis", "Frederika", "Frederike", "Frederique", "Froukje", "Gabriëlle", "Gea", "Geertje", "Geertrui", "Geertruida", "Geesje", "Geeske", "Gemma", "Georgina", "Geraldine", "Gerda", "Gerrie", "Gerry", "Gertrude", "Ghislaine", "Gina", "Gisela", "Godelieve", "Grada", "Greetje", "Greta", "Gretha", "Grietje", "Guusje", "Gwen", "Hadewig", "Hanna", "Hannah", "Hanneke", "Harmina", "Harmke", "Hayley", "Hedwig", "Heidi", "Heiltje", "Heintje", "Heleen", "Helen", "Helena", "Helène", "Helga", "Hendrika", "Hennie", "Henny", "Henrieke", "Henriëtte", "Hermien", "Hester", "Hetty", "Hilary", "Hilda", "Hilde", "Hildegard", "Hine", "Hope", "Hubertina", "Ida", "Ilana", "Ilja", "Ilona", "Ilonka", "Ilse", "Imke", "Ina", "Indiana", "Indy", "Ine", "Ineke", "Inez", "Inge", "Ingeborg", "Ingrid", "Irene", "Iris", "Irma", "Isa", "Isabel", "Isabella", "Isabelle", "Isis", "Ivonne", "Jacoba", "Jacqueline", "Jade", "Jane", "Janne", "Janneke", "Jannie", "Janny", "Jansje", "Jantine", "Jasmijn", "Jeanette", "Jeanine", "Jeanne", "Jeannette", "Jeanny", "Jennifer", "Jenny", "Jessica", "Jessie", "Jet", "Jetske", "Jette", "Jitske", "Joanna", "Joëlle", "Johanna", "Joke", "Jolanda", "Jolande", "Jolie", "Jolien", "Jolijn", "Jonne", "José", "Josefien", "Josephine", "Josine", "Joy", "Joyce", "Judith", "Julia", "Juliana", "Julie", "Juliette", "Karen", "Karin", "Karina", "Karlijn", "Katja", "Katrijn", "Kayla", "Kaylee", "Kayleigh", "Kelly", "Kendra", "Kensi", "Kiki", "Kim", "Kimberley", "Kimberly", "Kira", "Kirsten", "Kitty", "Klaasje", "Krista", "Kristel", "Kyra", "Laetitia", "Lara", "Larissa", "Laura", "Lauren", "Laurentien", "Leentje", "Lena", "Lenie", "Leonie", "Leonora", "Leontine", "Letitia", "Lianne", "Lidwina", "Lieke", "Lien", "Liesbeth", "Lieve", "Lilian", "Linda", "Linde", "Lindsay", "Lindsey", "Lisa", "Lisanne", "Lisette", "Lizzy", "Loes", "Lois", "Lola", "Lonneke", "Lotte", "Louisa", "Louise", "Lucia", "Luna", "Lydia", "Lyke", "Lynn", "Maaike", "Maartje", "Madeleine", "Madelief", "Mae", "Magdalena", "Maike", "Mandy", "Manon", "Manuela", "Mara", "Marcella", "Marcia", "Mare", "Marga", "Margaret", "Margo", "Margot", "Margriet", "Maria", "Marian", "Marianna", "Marianne", "Marie", "Marieke", "Mariëlle", "Mariëtte", "Marije", "Marijke", "Marijn", "Marike", "Marina", "Marion", "Mariska", "Marissa", "Marit", "Marja", "Marjan", "Marjolein", "Marjolijn", "Marleen", "Marlene", "Marlies", "Marloes", "Martha", "Marthe", "Martina", "Martine", "Mathilde", "Maud", "Maureen", "Maxime", "Maya", "Mayke", "Megan", "Meike", "Melanie", "Melissa", "Mercedes", "Merel", "Meta", "Mette", "Mia", "Michelle", "Mieke", "Mila", "Milena", "Milou", "Mina", "Minke", "Mira", "Miranda", "Mireille", "Miriam", "Mirjam", "Mirte", "Mirthe", "Monica", "Moniek", "Monique", "Myrthe", "Nadia", "Nadine", "Nancy", "Naomi", "Natalie", "Natasja", "Nathalie", "Neeltje", "Nele", "Nelleke", "Nellie", "Nelly", "Nicky", "Nicole", "Nienke", "Nikita", "Nina", "Noa", "Noëlla", "Noor", "Noortje", "Nora", "Nova", "Nynke", "Odilia", "Olga", "Olivia", "Pamela", "Patricia", "Patty", "Pascalle", "PaulaPaulien", "Pauline", "Petra", "Petronella", "Pia", "Pien", "Pieternel", "Pietertje", "Pleun", "Priscilla", "Puck", "Quinty", "Quirine", "Rachel", "Rachelle", "Ramona", "Rani", "Rebecca", "Regina", "Reina", "Renata", "Renate", "Renée", "Rens", "Renske", "Ria", "Rianne", "Rita", "Robin", "Romy", "Roos", "Rosa", "Rosalie", "Rosanne", "Rowena", "Roxanne", "Ruby", "Ruth", "Sabina", "Sabine", "Sabrina", "Sam", "Samantha", "Sandra", "Sandrine", "Sandy", "Sanna", "Sanne", "Sara", "Sarah", "Sascha", "Saskia", "Selena", "Selina", "Selma", "Senna", "Shannon", "Sharon", "Shirley", "Sietske", "Sigrid", "Silvana", "Silvia", "Simone", "Sjoerdtje", "Sjoukje", "Sofia", "Sofie", "Sonja", "Sophia", "Sophie", "Soraya", "Stefanie", "Stella", "Stephanie", "Sterre", "Susan", "Susanna", "Suzanna", "Suzanne", "Sylvia", "Sylvana", "Tamara", "Tanja", "Tara", "Tatjana", "Tess", "Tessa", "Thalia", "Thea", "Theodora", "Thérèse", "Theresia", "Tiffany", "Tine", "Tineke", "Tiny", "Tjitske", "Tonia", "Trijntje", "Ursula", "Valerie", "Vanessa", "Veerle", "Vera", "Veronica", "Veronique", "Victoria", "Virginia", "Vivian", "Wanda", "Welmoed", "Wendy", "Wies", "Wietske", "Wilhelmina", "Willeke", "Willemien", "Willemijn", "Willie", "Willy", "Wilma", "Xandra", "Yara", "Yasmin", "Yasmine", "Yentl", "Ymke", "Yolanda", "Yvette", "Yvonne", "Ziva", "Zoë", "Zwaantje",

        "Aart", "Aäron", "Abe", "Abel", "Abraham", "Abram", "Adolf", "Adriaan", "Adrianus", "Age", "Alain", "Albert", "Alex", "Alexander", "Alfons", "Ali", "Allard", "Alper", "André", "Andreas", "Andries", "Andy", "Angelo", "Anthonie", "Anthony", "Antoine", "Anton", "Antonie", "Antonius", "Antoon", "Anwar", "Arend", "Arie", "Arjan", "Arjen", "Arne", "Arno", "Arnold", "Arnoud", "Arnout", "Aron", "Arthur", "August", "Auke", "Axel", "Barend", "Barry", "Bart", "Barteld", "Bas", "Bastiaan", "Bauke", "Beau", "Ben", "Benjamin", "Berend", "Bernhard", "Berry", "Bert", "Bertus", "Bessel", "Björn", "Bob", "Boris", "Boudewijn", "Bouke", "Boy", "Bram", "Brandon", "Brent", "Brian", "Bruno", "Bryan", "Camiel", "Carel", "Carl", "Carlo", "Carlos", "Carol", "Carolus", "Cas", "Caspar", "Casper", "Cedric", "Cédric", "Cees", "Charles", "Chiel", "Chris", "Christiaan", "Christoffel", "Coen", "Connor", "Conor", "Constantijn", "Cor", "Coren", "Corné", "Cornelis", "Cornelius", "Daan", "Damian", "Daniel", "Daniël", "Danny", "Dave", "David", "Davy", "Dennis", "Derk", "Dick", "Diederik", "Dimitri", "Dinand", "Dirk", "Dion", "Dominic", "Dominique", "Donald", "Douwe", "Dries", "Durk", "Dylan", "Ed", "Eddie", "Eddy", "Edgar", "Eduard", "Edward", "Edwin", "Egbert", "Egon", "Elbert", "Eelco", "Elco", "Eldert", "Eli", "Elias", "Elja", "Elwin", "Emanuel", "Emerson", "Emiel", "Emmanuel", "Eric", "Erik", "Ernst", "Erwin", "Esra", "Ethan", "Etienne", "Eugène", "Evan", "Everhardus", "Evert", "Ewoud", "Ewout", "Ezra", "Fabian", "Fedde", "Feike", "Felix", "Ferre", "Ferdinand", "Fernando", "Ferry", "Filip", "Finn", "Floriaan", "Florian", "Florianus", "Floris", "Fokke", "Folkert", "Fons", "Francesco", "Francis", "Franciscus", "Frank", "Franklin", "Frans", "Fred", "Freddie", "Frederick", "Frederik", "Freek", "Friedrich", "Friso", "Frits", "Gabriël", "Gaetan", "Gareth", "Gary", "Geert", "Geoffrey", "George", "Gerard", "Gerardus", "Gerbrand", "Gerben", "Gerhard", "Gerhardus", "Gerk", "Gerrie", "Gerrit", "Gert", "Gertjan", "Gerwin", "Gert-Jan", "Ghislain", "Gideon", "Giel", "Gijs", "Gijsbert", "Gilles", "Gino", "Giovanni", "Glenn", "Godfried", "Gommaar", "Gorik", "Govert", "Graad", "Gradus", "Grant", "Gregory", "Guglielmo", "Guido", "Guilherme", "Guillaume", "Guillermo", "Günther", "Gus", "Gust", "Gustaaf", "Guus", "Guy", "Haakon", "Haije", "Hakan", "Halvard", "Hamer", "Han", "Hannes", "Hans", "Hansko", "Har", "Harald", "Harco", "Harm", "Harmen", "Harold", "Harrie", "Harro", "Harry", "Has", "Hasse", "Heerke", "Heike", "Heiko", "Hein", "Helmut", "Hendrik", "Henk", "Henk Jan", "Hennie", "Henri", "Henry", "Herbert", "Herman", "Hermen", "Hervé", "Hessel", "Herwig", "Hicham", "Hidde", "Hiëronymus", "Hilco", "Hildo", "Hinne", "Hotze", "Hubert", "Hugo", "Huub", "Hüsnü", "Hyltsje", "Ian", "Ibrahim", "Ids", "Idse", "Idsert", "Ignas", "Igor", "Ief", "IJsbrand", "Ilan", "Ilja", "Imco", "Imme", "Inger", "Inti", "Isa", "Isaac", "Isaak", "Ischa", "Ishan", "Isidoor", "Ivan", "Ivar", "Ive", "Ivo", "Iwan", "Iris", "istvan", "Jaap", "Jacco", "Jaco", "Jairey", "Jack", "Jacob", "Jacques", "Jaimy", "Jake", "Jamai", "James", "Jan", "Janko", "Janos", "Jan Jaap", "Jannes", "Jan-Willem", "Jarich", "Jari", "Jarig", "Jarl", "Jarno", "Jaro", "Jarvey", "Jason", "Jasper", "Javier", "Jay", "Jayden", "Jean", "Jean-Jacques", "Jean-Paul", "Jef", "Jeff", "Jeffrey", "Jelger", "Jelis", "Jelle", "Jelmar", "Jelmer", "Jelte", "Jens", "Jent", "Jentsje", "Jeremy", "Jeroen", "Jerold", "Jerome", "Jesse", "Jezus", "Jielis", "Jihan", "Jim", "Jip", "Jo", "Joachim", "Joan", "Job", "Jochem", "Jochen", "Joël", "Joe", "Joep", "Joeri", "Joes", "Joey", "Joffrey", "Johan", "Johannes", "John", "Johnny", "Jon", "Jonas", "Jonatan", "Jonathan", "Jonne", "Jonny", "Joop", "Joost", "Jop", "Joppe", "Joram", "Joran", "Joras", "Jordi", "Jordy", "Joren", "Jorg", "Jorik", "Jorin", "Joris", "Jorn", "Jorrit", "Jort", "Jory", "Jos", "Joshua", "Jouke", "Jozef", "Jozias", "Jozua", "Judas", "Julian", "Julius", "Jules", "Julien", "Junior", "Jurgen", "Jurjen", "Jurn", "Jurre", "Jurriaan", "Jurrian", "Just", "Justin", "Justus", "Juul", "Juust", "Jyrki", "Kaeso", "Kai", "Kamiel", "Kalle", "Kane", "Karel", "Karim", "Karinus", "Karl", "Kasper", "Keanu", "Kees", "Keith", "Kelvin", "Ken", "Kenji", "Kenneth", "Kenny", "Kenzo", "Kevin", "Khalid", "Kiano", "Kick", "Kieran", "Kik", "Kilian", "Kjeld", "Klaas", "Klemen", "Knut", "Ko", "Kobus", "Koen", "Koenraad", "Koert", "Kofi", "Koos", "Korneel", "Krelis", "Krijn", "Kris", "Kristan", "Kristian", "Kristof", "Kuno", "Kurt", "Kwinten", "Kyrell", "Lambert", "Lammert", "Lamptey", "Lancelot", "Lander", "Lard", "Lars", "Lasse", "Laurens", "Laurent", "Laurents", "Laurenz", "Leander", "Leen", "Leendert", "Leense", "Lennaert", "Lennard", "Lennart", "Lennert", "Leo", "Leon", "Leonard", "Leopold", "Leroy", "Lesley", "Lester", "Levenez", "Levi", "Lex", "Liam", "Lieven", "Lieuwe", "Lode", "Lodewijk", "Logan", "Lolle", "Lorens", "Lorenz", "Lou", "Louie", "Louis", "Louw", "Luc", "Luca", "Lucas", "Ludo", "Luk", "Luke", "Luuc", "Luuk", "Lux", "Maarten", "Machiel", "Maikel", "Manuel", "Marc", "Marc-Marie", "Marco", "Marcel", "Marcellus", "Marcus", "Marek", "Marijn", "Marinus", "Mario", "Marius", "Mark", "Marnick", "Marniks", "Marnix", "Mart", "Marten", "Martijn", "Martin", "Martinus", "Mathias", "Mathieu", "Mathijs", "Mats", "Matthew", "Matthias", "Matthijs", "Mattijn", "Matty", "Maurice", "Maurits", "Mauro", "Max", "Maxim", "Maxime", "Maximiliaan", "Mees", "Meindert", "Melle", "Mels", "Melroy", "Menno", "Merijn", "Merlijn", "Micaël", "Micil", "Micha", "Michaël", "Michel", "Michiel", "Mick", "Mickey", "Mien", "Miguel", "Mijndert", "Mike", "Milan", "Milano", "Miles", "Mink", "Miquel", "Miroslav", "Mirano", "Misha", "Misja", "Mitch", "Mitchel", "Mitchell", "Mitis", "Mohammed", "Moreno", "Morgens", "Morris", "Mounir", "Moussa", "Mustafa", "Mylan", "Myron", "Nabil", "Nadi", "Naftali", "Nasir", "Nasser", "Nathan", "Nathaniël", "Naud", "Naut", "Nauth", "Neal", "Nelis", "Nelson", "Nick", "Nico", "Nicolaas", "Nicolas", "Niek", "Niel", "Niele", "Niels", "Nigel", "Nikita", "Nikki", "Niko", "Nikolaas", "Nikolai", "Nilesh", "Nils", "Nino", "Noah", "Norbert", "Norwin", "Noud", "Nout", "Nouth", "Octaaf", "Odin", "Oguz", "Oguzhan", "Okan", "Okke", "Olaf", "Olav", "Ole", "Oleg", "Olger", "Oliver", "Olivier", "Olkanson", "Olov", "Onno", "Oscar", "Oskar", "Oswin", "Othman", "Ot", "Otto", "Ovidius", "Owen", "Özkar", "Pablo", "Pascal", "Patrick", "Paul", "Paulus", "Pedro", "Peer", "Pelle", "Pepijn", "Per", "Peter", "Petrus", "Philip", "Philippe", "Pier", "Pierre", "Piet", "Pieter", "Pim", "Pjotr", "Pleun", "Puck", "Quentin", "Quido", "Quinn", "Quincy", "Quinten", "Quintin", "Quintus", "Quirein", "Quirijn", "Raf", "Rafael", "Raief", "Rakesh", "Rakke", "Ralf", "Ralph", "Ramesa", "Ramesh", "Ramon", "Ramses", "Randal", "Raoul", "Raymon", "Raymond", "Reginald", "Reimert", "Rein", "Reinbert", "Reindert", "Reiner", "Reinhard", "Reinier", "Reinout", "Remco", "Remko", "Remi", "Remy", "Renaldo", "Renato", "Renatus", "René", "Renger", "Rens", "Reuven", "Ricardo", "Ricco", "Richard", "Rick", "Ricky", "Rico", "Riekele", "Riemer", "Rien", "Ries", "Rijk", "Rijmar", "Rijo", "Rik", "Rinke", "Rinse", "Rinus", "Riny", "Rinze", "Ritz", "Roald", "Roan", "Rob", "Robbe", "Robbert", "Robbert-Jan", "Robert", "Robert-Jan", "Roberto", "Robin", "Robrecht", "Rocco", "Roderick", "Rodney", "Rodrigo", "Roel", "Roeland", "Roelof", "Roger", "Rogier", "Rokus", "Rolán", "Roland", "Rolf", "Rolof", "Roman", "Ron", "Ronald", "Ronnie", "Ronny", "Ross", "Rover", "Roy", "Ruben", "Rudi", "Rudiger", "Rudolf", "Rutger", "Ruth", "Rudy", "Runar", "Rune", "Ruslan", "Russell", "Ruud", "Ruurd", "Ryan", "Salvador", "Salvator", "Sam", "Sami", "Samir", "Samson", "Samy", "Sander", "Sandro", "Sandrijn", "Santinho", "Sape", "Sathya", "Satish", "Scato", "Scott", "Séamus", "Sean", "Sebastiaan", "Sem", "Senne", "Sepp", "Seppe", "Serge", "Sergei", "Serkan", "Serafim", "Servien", "Severinus", "Seto", "Shane", "Sharo", "Shimon", "Sibert", "Sibo", "Sibren", "Siebe", "Siebren", "Siegfried", "Siem", "Sierk", "Sietse", "Sigmund", "Sil", "Silvijn", "Sijmen", "Simba", "Simeon", "Simon", "Sithri", "Sjaak", "Sjard", "Sjef", "Sjeng", "Sjerp", "Sjimmie", "Sjoerd", "Sjors", "Sjouke", "Solee", "Sonny", "Splinter", "Stach", "Stan", "Stanley", "Stef", "Stefaan", "Stefan", "Stefano", "Steff", "Steffen", "Stephan", "Stephanos", "Steve", "Steven", "Stijn", "Stoffel", "Sumano", "Sus", "Sudesh", "Sven", "Sylvain", "Sylvester", "Sylvio", "Sytze", "Taco", "Teije", "Teun", "Theo", "Theodoor", "Theodorus", "Theofiel", "Theunis", "Thibaut", "Thijs", "Thom", "Thomas", "Tiemen", "Tijmen", "Tijs", "Tijn", "Tim", "Timo", "Timothy", "Tjalling", "Tjeerd", "Tjerk", "Tobias", "Antoine", "Tom", "Tomas", "Tommy", "Ton", "Tony", "Thibault", "Toon", "Tristan", "Twan", "Tycho", "Ulrich", "Urbanus", "Uri", "Valentijn", "Vic", "Victor", "Vik", "Viktor", "Vilém", "Vince", "Vincent", "Vinny", "Vladimir", "Volkert", "Walt", "Walter", "Warren", "Werner", "Wesley", "Wessel", "Wiebe", "Wieger", "Wietse", "Wijnand", "Wijnant", "Wilbert", "Wilco", "Wilfred", "Wilfried", "Wilhelm", "Willem", "William", "Willie", "Willy", "Wim", "Wiro", "Wladimir", "Wolter", "Wout", "Wouter", "Warre", "Xander", "Xaveer", "Xaverius", "Xavier", "Yannick", "Yassine", "Ybo", "Yorick", "Youri", "Youssef", "Yuri", "Yvan", "Yves", "Yvo", "Yvon", "Zakaria", "Zander", "Zeger", "Zeno", "Zoltán", "Zyren"

    ]

    static let achternamen: Self = [
        "de Jong",
        "Jansen",
        "de Vries",
        "van den Berg",
        "van Dijk",
        "Bakker",
        "Janssen",
        "Visser",
        "Smit",
        "Meijer",
        "de Boer",
        "Mulder",
        "de Groot",
        "Bos",
        "Vos",
        "Peters",
        "Hendriks",
        "van Leeuwen",
        "Dekker",
        "Brouwer",
        "de Wit",
        "Dijkstra",
        "Smits",
        "de Graaf",
        "van der Meer",
        "van der Linden",
        "Kok",
        "Jacobs",
        "de Haan",
        "Vermeulen",
        "van den Heuvel",
        "van der Veen",
        "van den Broek",
        "de Bruijn, de Bruyn",
        "de Bruin",
        "van der Heijden",
        "Schouten",
        "van Beek",
        "Willems",
        "van Vliet",
        "van de Ven",
        "Hoekstra",
        "Maas",
        "Verhoeven",
        "Koster",
        "van Dam",
        "van der Wal",
        "Prins",
        "Blom",
        "Huisman",
        "Peeters",
        "de Jonge",
        "Kuipers",
        "van Veen",
        "Post",
        "Kuiper",
        "Veenstra",
        "Kramer",
        "van den Brink",
        "Scholten",
        "van Wijk",
        "Postma",
        "Martens",
        "Vink",
        "de Ruiter",
        "Timmermans",
        "Groen",
        "Gerritsen",
        "Jonker",
        "van Loon",
        "Boer",
        "van der Velde",
        "Willemsen",
        "Smeets",
        "de Lange",
        "de Vos",
        "Bosch",
        "van Dongen",
        "Schipper",
        "de Koning",
        "van der Laan",
        "Koning",
        "van der Velden",
        "Driessen",
        "van Doorn",
        "Hermans",
        "Evers",
        "van den Bosch",
        "van der Meulen",
        "Hofman",
        "Bosman",
        "Wolters",
        "Sanders",
        "van der Horst",
        "Mol",
        "Kuijpers, Kuypers",
        "Molenaar",
        "van de Pol",
        "de Leeuw",
        "Verbeek"
    ]
}

public extension [String] {
    static func articleTemplate(amount: Int) -> Self {
        (1...amount).map { number in
            """
            import ToolKit
            import Plot
            import Language
            import State
            import Money
            import Percent
            import CasePaths

            public struct Article\(number):Codable & Hashable {

            }

            public extension Article\(number) {

            }

            public extension Article\(number) {
                struct Sub1:Codable & Hashable {

                }
            }

            public extension Article\(number) {
                struct Sub2:Codable & Hashable {

                }
            }

            public extension Article\(number) {
                struct Sub3:Codable & Hashable {

                }
            }

            public extension Article\(number) {
                struct Sub4:Codable & Hashable {

                }
            }
            """
        }
    }
}
