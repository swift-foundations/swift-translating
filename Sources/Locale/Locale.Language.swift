//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 23/07/2024.
//

import Foundation




public extension Locale {
    // Afrikaans
    static let af: Self = .init(identifier: "af")
    static let afrikaans: Self = .af
    static let af_NA: Self = .init(identifier: "af_NA")
    static let afrikaansNamibia: Self = .af_NA
    static let af_ZA: Self = .init(identifier: "af_ZA")
    static let afrikaansSouthAfrica: Self = .af_ZA
    
    // Arabic
    static let ar: Self = .init(identifier: "ar")
    static let arabic: Self = .ar
    static let ar_001: Self = .init(identifier: "ar_001")
    static let arabicWorld: Self = .ar_001
    static let ar_AE: Self = .init(identifier: "ar_AE")
    static let arabicUAE: Self = .ar_AE
    static let ar_BH: Self = .init(identifier: "ar_BH")
    static let arabicBahrain: Self = .ar_BH
    static let ar_DJ: Self = .init(identifier: "ar_DJ")
    static let arabicDjibouti: Self = .ar_DJ
    static let ar_DZ: Self = .init(identifier: "ar_DZ")
    static let arabicAlgeria: Self = .ar_DZ
    static let ar_EG: Self = .init(identifier: "ar_EG")
    static let arabicEgypt: Self = .ar_EG
    static let ar_EH: Self = .init(identifier: "ar_EH")
    static let arabicWesternSahara: Self = .ar_EH
    static let ar_ER: Self = .init(identifier: "ar_ER")
    static let arabicEritrea: Self = .ar_ER
    static let ar_IL: Self = .init(identifier: "ar_IL")
    static let arabicIsrael: Self = .ar_IL
    static let ar_IQ: Self = .init(identifier: "ar_IQ")
    static let arabicIraq: Self = .ar_IQ
    static let ar_JO: Self = .init(identifier: "ar_JO")
    static let arabicJordan: Self = .ar_JO
    static let ar_KM: Self = .init(identifier: "ar_KM")
    static let arabicComoros: Self = .ar_KM
    static let ar_KW: Self = .init(identifier: "ar_KW")
    static let arabicKuwait: Self = .ar_KW
    static let ar_LB: Self = .init(identifier: "ar_LB")
    static let arabicLebanon: Self = .ar_LB
    static let ar_LY: Self = .init(identifier: "ar_LY")
    static let arabicLibya: Self = .ar_LY
    static let ar_MA: Self = .init(identifier: "ar_MA")
    static let arabicMorocco: Self = .ar_MA
    static let ar_MR: Self = .init(identifier: "ar_MR")
    static let arabicMauritania: Self = .ar_MR
    static let ar_OM: Self = .init(identifier: "ar_OM")
    static let arabicOman: Self = .ar_OM
    static let ar_PS: Self = .init(identifier: "ar_PS")
    static let arabicPalestine: Self = .ar_PS
    static let ar_QA: Self = .init(identifier: "ar_QA")
    static let arabicQatar: Self = .ar_QA
    static let ar_SA: Self = .init(identifier: "ar_SA")
    static let arabicSaudiArabia: Self = .ar_SA
    static let ar_SD: Self = .init(identifier: "ar_SD")
    static let arabicSudan: Self = .ar_SD
    static let ar_SO: Self = .init(identifier: "ar_SO")
    static let arabicSomalia: Self = .ar_SO
    static let ar_SS: Self = .init(identifier: "ar_SS")
    static let arabicSouthSudan: Self = .ar_SS
    static let ar_SY: Self = .init(identifier: "ar_SY")
    static let arabicSyria: Self = .ar_SY
    static let ar_TD: Self = .init(identifier: "ar_TD")
    static let arabicChad: Self = .ar_TD
    static let ar_TN: Self = .init(identifier: "ar_TN")
    static let arabicTunisia: Self = .ar_TN
    static let ar_YE: Self = .init(identifier: "ar_YE")
    static let arabicYemen: Self = .ar_YE
    
    // Akan
    static let ak: Self = .init(identifier: "ak")
    static let akan: Self = .ak
    static let ak_GH: Self = .init(identifier: "ak_GH")
    static let akanGhana: Self = .ak_GH
    
    // Amharic
    static let am: Self = .init(identifier: "am")
    static let amharic: Self = .am
    static let am_ET: Self = .init(identifier: "am_ET")
    static let amharicEthiopia: Self = .am_ET
    
    // Azerbaijani
    static let az: Self = .init(identifier: "az")
    static let azerbaijani: Self = .az
    static let az_Cyrl: Self = .init(identifier: "az_Cyrl")
    static let azerbaijaniCyrillic: Self = .az_Cyrl
    static let az_Cyrl_AZ: Self = .init(identifier: "az_Cyrl_AZ")
    static let azerbaijaniCyrillicAzerbaijan: Self = .az_Cyrl_AZ
    static let az_Latn: Self = .init(identifier: "az_Latn")
    static let azerbaijaniLatin: Self = .az_Latn
    static let az_Latn_AZ: Self = .init(identifier: "az_Latn_AZ")
    static let azerbaijaniLatinAzerbaijan: Self = .az_Latn_AZ
    
    // Belarusian
    static let be: Self = .init(identifier: "be")
    static let belarusian: Self = .be
    static let be_BY: Self = .init(identifier: "be_BY")
    static let belarusianBelarus: Self = .be_BY
    
    // Bulgarian
    static let bg: Self = .init(identifier: "bg")
    static let bulgarian: Self = .bg
    static let bg_BG: Self = .init(identifier: "bg_BG")
    static let bulgarianBulgaria: Self = .bg_BG
    
    // Bengali
    static let bn: Self = .init(identifier: "bn")
    static let bengali: Self = .bn
    static let bn_BD: Self = .init(identifier: "bn_BD")
    static let bengaliBangladesh: Self = .bn_BD
    static let bn_IN: Self = .init(identifier: "bn_IN")
    static let bengaliIndia: Self = .bn_IN
    
    // Bosnian
    static let bs: Self = .init(identifier: "bs")
    static let bosnian: Self = .bs
    static let bs_Cyrl: Self = .init(identifier: "bs_Cyrl")
    static let bosnianCyrillic: Self = .bs_Cyrl
    static let bs_Cyrl_BA: Self = .init(identifier: "bs_Cyrl_BA")
    static let bosnianCyrillicBosnia: Self = .bs_Cyrl_BA
    static let bs_Latn: Self = .init(identifier: "bs_Latn")
    static let bosnianLatin: Self = .bs_Latn
    static let bs_Latn_BA: Self = .init(identifier: "bs_Latn_BA")
    static let bosnianLatinBosnia: Self = .bs_Latn_BA
    
    // Catalan
    static let ca: Self = .init(identifier: "ca")
    static let catalan: Self = .ca
    static let ca_AD: Self = .init(identifier: "ca_AD")
    static let catalanAndorra: Self = .ca_AD
    static let ca_ES: Self = .init(identifier: "ca_ES")
    static let catalanSpain: Self = .ca_ES
    static let ca_FR: Self = .init(identifier: "ca_FR")
    static let catalanFrance: Self = .ca_FR
    static let ca_IT: Self = .init(identifier: "ca_IT")
    static let catalanItaly: Self = .ca_IT
    
    // Chechen
    static let ce: Self = .init(identifier: "ce")
    static let chechen: Self = .ce
    static let ce_RU: Self = .init(identifier: "ce_RU")
    static let chechenRussia: Self = .ce_RU
    
    // Czech
    static let cs: Self = .init(identifier: "cs")
    static let czech: Self = .cs
    static let cs_CZ: Self = .init(identifier: "cs_CZ")
    static let czechCzechia: Self = .cs_CZ
    
    // Chuvash
    static let cv: Self = .init(identifier: "cv")
    static let chuvash: Self = .cv
    static let cv_RU: Self = .init(identifier: "cv_RU")
    static let chuvashRussia: Self = .cv_RU
    
    // Welsh
    static let cy: Self = .init(identifier: "cy")
    static let welsh: Self = .cy
    static let cy_GB: Self = .init(identifier: "cy_GB")
    static let welshUK: Self = .cy_GB
    
    // Danish
    static let da: Self = .init(identifier: "da")
    static let danish: Self = .da
    static let da_DK: Self = .init(identifier: "da_DK")
    static let danishDenmark: Self = .da_DK
    static let da_GL: Self = .init(identifier: "da_GL")
    static let danishGreenland: Self = .da_GL
    
    // German
    static let de: Self = .init(identifier: "de")
    static let german: Self = .de
    static let de_AT: Self = .init(identifier: "de_AT")
    static let germanAustria: Self = .de_AT
    static let de_BE: Self = .init(identifier: "de_BE")
    static let germanBelgium: Self = .de_BE
    static let de_CH: Self = .init(identifier: "de_CH")
    static let germanSwitzerland: Self = .de_CH
    static let de_DE: Self = .init(identifier: "de_DE")
    static let germanGermany: Self = .de_DE
    static let de_IT: Self = .init(identifier: "de_IT")
    static let germanItaly: Self = .de_IT
    static let de_LI: Self = .init(identifier: "de_LI")
    static let germanLiechtenstein: Self = .de_LI
    static let de_LU: Self = .init(identifier: "de_LU")
    static let germanLuxembourg: Self = .de_LU
    
    // Dzongkha
    static let dz: Self = .init(identifier: "dz")
    static let dzongkha: Self = .dz
    static let dz_BT: Self = .init(identifier: "dz_BT")
    static let dzongkhaBhutan: Self = .dz_BT
    
    // Greek
    static let el: Self = .init(identifier: "el")
    static let greek: Self = .el
    static let el_CY: Self = .init(identifier: "el_CY")
    static let greekCyprus: Self = .el_CY
    static let el_GR: Self = .init(identifier: "el_GR")
    static let greekGreece: Self = .el_GR
    
    // English
    static let en: Self = .init(identifier: "en")
    static let english: Self = .en
    static let en_001: Self = .init(identifier: "en_001")
    static let englishWorld: Self = .en_001
    static let en_150: Self = .init(identifier: "en_150")
    static let englishEurope: Self = .en_150
    static let en_AE: Self = .init(identifier: "en_AE")
    static let englishUAE: Self = .en_AE
    static let en_AG: Self = .init(identifier: "en_AG")
    static let englishAntigua: Self = .en_AG
    static let en_AI: Self = .init(identifier: "en_AI")
    static let englishAnguilla: Self = .en_AI
    static let en_AL: Self = .init(identifier: "en_AL")
    static let englishAlbania: Self = .en_AL
    static let en_AR: Self = .init(identifier: "en_AR")
    static let englishArgentina: Self = .en_AR
    static let en_AS: Self = .init(identifier: "en_AS")
    static let englishAmericanSamoa: Self = .en_AS
    static let en_AT: Self = .init(identifier: "en_AT")
    static let englishAustria: Self = .en_AT
    static let en_AU: Self = .init(identifier: "en_AU")
    static let englishAustralia: Self = .en_AU
    static let en_BB: Self = .init(identifier: "en_BB")
    static let englishBarbados: Self = .en_BB
    static let en_BD: Self = .init(identifier: "en_BD")
    static let englishBangladesh: Self = .en_BD
    static let en_BE: Self = .init(identifier: "en_BE")
    static let englishBelgium: Self = .en_BE
    static let en_BG: Self = .init(identifier: "en_BG")
    static let englishBulgaria: Self = .en_BG
    static let en_BI: Self = .init(identifier: "en_BI")
    static let englishBurundi: Self = .en_BI
    static let en_BM: Self = .init(identifier: "en_BM")
    static let englishBermuda: Self = .en_BM
    static let en_BN: Self = .init(identifier: "en_BN")
    static let englishBrunei: Self = .en_BN
    static let en_BR: Self = .init(identifier: "en_BR")
    static let englishBrazil: Self = .en_BR
    static let en_BS: Self = .init(identifier: "en_BS")
    static let englishBahamas: Self = .en_BS
    static let en_BW: Self = .init(identifier: "en_BW")
    static let englishBotswana: Self = .en_BW
    static let en_BZ: Self = .init(identifier: "en_BZ")
    static let englishBelize: Self = .en_BZ
    static let en_CA: Self = .init(identifier: "en_CA")
    static let englishCanada: Self = .en_CA
    static let en_CC: Self = .init(identifier: "en_CC")
    static let englishCocos: Self = .en_CC
    static let en_CH: Self = .init(identifier: "en_CH")
    static let englishSwitzerland: Self = .en_CH
    static let en_CK: Self = .init(identifier: "en_CK")
    static let englishCookIslands: Self = .en_CK
    static let en_CL: Self = .init(identifier: "en_CL")
    static let englishChile: Self = .en_CL
    static let en_CM: Self = .init(identifier: "en_CM")
    static let englishCameroon: Self = .en_CM
    static let en_CN: Self = .init(identifier: "en_CN")
    static let englishChina: Self = .en_CN
    static let en_CO: Self = .init(identifier: "en_CO")
    static let englishColombia: Self = .en_CO
    static let en_CX: Self = .init(identifier: "en_CX")
    static let englishChristmasIsland: Self = .en_CX
    static let en_CY: Self = .init(identifier: "en_CY")
    static let englishCyprus: Self = .en_CY
    static let en_CZ: Self = .init(identifier: "en_CZ")
    static let englishCzechia: Self = .en_CZ
    static let en_DE: Self = .init(identifier: "en_DE")
    static let englishGermany: Self = .en_DE
    static let en_DG: Self = .init(identifier: "en_DG")
    static let englishDiegoGarcia: Self = .en_DG
    static let en_DK: Self = .init(identifier: "en_DK")
    static let englishDenmark: Self = .en_DK
    static let en_DM: Self = .init(identifier: "en_DM")
    static let englishDominica: Self = .en_DM
    static let en_EE: Self = .init(identifier: "en_EE")
    static let englishEstonia: Self = .en_EE
    static let en_ER: Self = .init(identifier: "en_ER")
    static let englishEritrea: Self = .en_ER
    static let en_FI: Self = .init(identifier: "en_FI")
    static let englishFinland: Self = .en_FI
    static let en_FJ: Self = .init(identifier: "en_FJ")
    static let englishFiji: Self = .en_FJ
    static let en_FK: Self = .init(identifier: "en_FK")
    static let englishFalklandIslands: Self = .en_FK
    static let en_FM: Self = .init(identifier: "en_FM")
    static let englishMicronesia: Self = .en_FM
    static let en_FR: Self = .init(identifier: "en_FR")
    static let englishFrance: Self = .en_FR
    static let en_GB: Self = .init(identifier: "en_GB")
    static let englishUK: Self = .en_GB
    static let en_GD: Self = .init(identifier: "en_GD")
    static let englishGrenada: Self = .en_GD
    static let en_GG: Self = .init(identifier: "en_GG")
    static let englishGuernsey: Self = .en_GG
    static let en_GH: Self = .init(identifier: "en_GH")
    static let englishGhana: Self = .en_GH
    static let en_GI: Self = .init(identifier: "en_GI")
    static let englishGibraltar: Self = .en_GI
    static let en_GM: Self = .init(identifier: "en_GM")
    static let englishGambia: Self = .en_GM
    static let en_GR: Self = .init(identifier: "en_GR")
    static let englishGreece: Self = .en_GR
    static let en_GU: Self = .init(identifier: "en_GU")
    static let englishGuam: Self = .en_GU
    static let en_GY: Self = .init(identifier: "en_GY")
    static let englishGuyana: Self = .en_GY
    static let en_HK: Self = .init(identifier: "en_HK")
    static let englishHongKong: Self = .en_HK
    static let en_HU: Self = .init(identifier: "en_HU")
    static let englishHungary: Self = .en_HU
    static let en_ID: Self = .init(identifier: "en_ID")
    static let englishIndonesia: Self = .en_ID
    static let en_IE: Self = .init(identifier: "en_IE")
    static let englishIreland: Self = .en_IE
    static let en_IL: Self = .init(identifier: "en_IL")
    static let englishIsrael: Self = .en_IL
    static let en_IM: Self = .init(identifier: "en_IM")
    static let englishIsleOfMan: Self = .en_IM
    static let en_IN: Self = .init(identifier: "en_IN")
    static let englishIndia: Self = .en_IN
    static let en_IO: Self = .init(identifier: "en_IO")
    static let englishBritishIndianOceanTerritory: Self = .en_IO
    static let en_JE: Self = .init(identifier: "en_JE")
    static let englishJersey: Self = .en_JE
    static let en_JM: Self = .init(identifier: "en_JM")
    static let englishJamaica: Self = .en_JM
    static let en_JP: Self = .init(identifier: "en_JP")
    static let englishJapan: Self = .en_JP
    static let en_KE: Self = .init(identifier: "en_KE")
    static let englishKenya: Self = .en_KE
    static let en_KI: Self = .init(identifier: "en_KI")
    static let englishKiribati: Self = .en_KI
    static let en_KN: Self = .init(identifier: "en_KN")
    static let englishSaintKittsAndNevis: Self = .en_KN
    static let en_KR: Self = .init(identifier: "en_KR")
    static let englishKorea: Self = .en_KR
    static let en_KY: Self = .init(identifier: "en_KY")
    static let englishCaymanIslands: Self = .en_KY
    static let en_LC: Self = .init(identifier: "en_LC")
    static let englishSaintLucia: Self = .en_LC
    static let en_LR: Self = .init(identifier: "en_LR")
    static let englishLiberia: Self = .en_LR
    static let en_LS: Self = .init(identifier: "en_LS")
    static let englishLesotho: Self = .en_LS
    static let en_LT: Self = .init(identifier: "en_LT")
    static let englishLithuania: Self = .en_LT
    static let en_LV: Self = .init(identifier: "en_LV")
    static let englishLatvia: Self = .en_LV
    static let en_MG: Self = .init(identifier: "en_MG")
    static let englishMadagascar: Self = .en_MG
    static let en_MH: Self = .init(identifier: "en_MH")
    static let englishMarshallIslands: Self = .en_MH
    static let en_MM: Self = .init(identifier: "en_MM")
    static let englishMyanmar: Self = .en_MM
    static let en_MO: Self = .init(identifier: "en_MO")
    static let englishMacau: Self = .en_MO
    static let en_MP: Self = .init(identifier: "en_MP")
    static let englishNorthernMarianaIslands: Self = .en_MP
    static let en_MS: Self = .init(identifier: "en_MS")
    static let englishMontserrat: Self = .en_MS
    static let en_MT: Self = .init(identifier: "en_MT")
    static let englishMalta: Self = .en_MT
    static let en_MU: Self = .init(identifier: "en_MU")
    static let englishMauritius: Self = .en_MU
    static let en_MV: Self = .init(identifier: "en_MV")
    static let englishMaldives: Self = .en_MV
    static let en_MW: Self = .init(identifier: "en_MW")
    static let englishMalawi: Self = .en_MW
    static let en_MX: Self = .init(identifier: "en_MX")
    static let englishMexico: Self = .en_MX
    static let en_MY: Self = .init(identifier: "en_MY")
    static let englishMalaysia: Self = .en_MY
    static let en_NA: Self = .init(identifier: "en_NA")
    static let englishNamibia: Self = .en_NA
    static let en_NF: Self = .init(identifier: "en_NF")
    static let englishNorfolkIsland: Self = .en_NF
    static let en_NG: Self = .init(identifier: "en_NG")
    static let englishNigeria: Self = .en_NG
    static let en_NL: Self = .init(identifier: "en_NL")
    static let englishNetherlands: Self = .en_NL
    static let en_NO: Self = .init(identifier: "en_NO")
    static let englishNorway: Self = .en_NO
    static let en_NR: Self = .init(identifier: "en_NR")
    static let englishNauru: Self = .en_NR
    static let en_NU: Self = .init(identifier: "en_NU")
    static let englishNiue: Self = .en_NU
    static let en_NZ: Self = .init(identifier: "en_NZ")
    static let englishNewZealand: Self = .en_NZ
    static let en_PG: Self = .init(identifier: "en_PG")
    static let englishPapuaNewGuinea: Self = .en_PG
    static let en_PH: Self = .init(identifier: "en_PH")
    static let englishPhilippines: Self = .en_PH
    static let en_PK: Self = .init(identifier: "en_PK")
    static let englishPakistan: Self = .en_PK
    static let en_PL: Self = .init(identifier: "en_PL")
    static let englishPoland: Self = .en_PL
    static let en_PN: Self = .init(identifier: "en_PN")
    static let englishPitcairnIslands: Self = .en_PN
    static let en_PR: Self = .init(identifier: "en_PR")
    static let englishPuertoRico: Self = .en_PR
    static let en_PT: Self = .init(identifier: "en_PT")
    static let englishPortugal: Self = .en_PT
    static let en_PW: Self = .init(identifier: "en_PW")
    static let englishPalau: Self = .en_PW
    static let en_RW: Self = .init(identifier: "en_RW")
    static let englishRwanda: Self = .en_RW
    static let en_SA: Self = .init(identifier: "en_SA")
    static let englishSaudiArabia: Self = .en_SA
    static let en_SB: Self = .init(identifier: "en_SB")
    static let englishSolomonIslands: Self = .en_SB
    static let en_SC: Self = .init(identifier: "en_SC")
    static let englishSeychelles: Self = .en_SC
    static let en_SD: Self = .init(identifier: "en_SD")
    static let englishSudan: Self = .en_SD
    static let en_SE: Self = .init(identifier: "en_SE")
    static let englishSweden: Self = .en_SE
    static let en_SG: Self = .init(identifier: "en_SG")
    static let englishSingapore: Self = .en_SG
    static let en_SH: Self = .init(identifier: "en_SH")
    static let englishSaintHelena: Self = .en_SH
    static let en_SI: Self = .init(identifier: "en_SI")
    static let englishSlovenia: Self = .en_SI
    static let en_SK: Self = .init(identifier: "en_SK")
    static let englishSlovakia: Self = .en_SK
    static let en_SL: Self = .init(identifier: "en_SL")
    static let englishSierraLeone: Self = .en_SL
    static let en_SS: Self = .init(identifier: "en_SS")
    static let englishSouthSudan: Self = .en_SS
    static let en_SX: Self = .init(identifier: "en_SX")
    static let englishSintMaarten: Self = .en_SX
    static let en_SZ: Self = .init(identifier: "en_SZ")
    static let englishEswatini: Self = .en_SZ
    static let en_TC: Self = .init(identifier: "en_TC")
    static let englishTurksAndCaicosIslands: Self = .en_TC
    static let en_TH: Self = .init(identifier: "en_TH")
    static let englishThailand: Self = .en_TH
    static let en_TK: Self = .init(identifier: "en_TK")
    static let englishTokelau: Self = .en_TK
    static let en_TO: Self = .init(identifier: "en_TO")
    static let englishTonga: Self = .en_TO
    static let en_TR: Self = .init(identifier: "en_TR")
    static let englishTurkey: Self = .en_TR
    static let en_TT: Self = .init(identifier: "en_TT")
    static let englishTrinidadAndTobago: Self = .en_TT
    static let en_TV: Self = .init(identifier: "en_TV")
    static let englishTuvalu: Self = .en_TV
    static let en_TW: Self = .init(identifier: "en_TW")
    static let englishTaiwan: Self = .en_TW
    static let en_TZ: Self = .init(identifier: "en_TZ")
    static let englishTanzania: Self = .en_TZ
    static let en_UA: Self = .init(identifier: "en_UA")
    static let englishUkraine: Self = .en_UA
    static let en_UG: Self = .init(identifier: "en_UG")
    static let englishUganda: Self = .en_UG
    static let en_UM: Self = .init(identifier: "en_UM")
    static let englishUSOutlyingIslands: Self = .en_UM
    static let en_US: Self = .init(identifier: "en_US")
    static let englishUS: Self = .en_US
    static let en_VC: Self = .init(identifier: "en_VC")
    static let englishSaintVincentAndGrenadines: Self = .en_VC
    static let en_VG: Self = .init(identifier: "en_VG")
    static let englishBritishVirginIslands: Self = .en_VG
    static let en_VI: Self = .init(identifier: "en_VI")
    static let englishUSVirginIslands: Self = .en_VI
    static let en_VU: Self = .init(identifier: "en_VU")
    static let englishVanuatu: Self = .en_VU
    static let en_WS: Self = .init(identifier: "en_WS")
    static let englishSamoa: Self = .en_WS
    static let en_ZA: Self = .init(identifier: "en_ZA")
    static let englishSouthAfrica: Self = .en_ZA
    static let en_ZM: Self = .init(identifier: "en_ZM")
    static let englishZambia: Self = .en_ZM
    static let en_ZW: Self = .init(identifier: "en_ZW")
    static let englishZimbabwe: Self = .en_ZW
    
    // Spanish
    static let es: Self = .init(identifier: "es")
    static let spanish: Self = .es
    static let es_003: Self = .init(identifier: "es_003")
    static let spanishNorthAmerica: Self = .es_003
    static let es_419: Self = .init(identifier: "es_419")
    static let spanishLatinAmerica: Self = .es_419
    static let es_AG: Self = .init(identifier: "es_AG")
    static let spanishAntigua: Self = .es_AG
    static let es_AR: Self = .init(identifier: "es_AR")
    static let spanishArgentina: Self = .es_AR
    static let es_BB: Self = .init(identifier: "es_BB")
    static let spanishBarbados: Self = .es_BB
    static let es_BM: Self = .init(identifier: "es_BM")
    static let spanishBermuda: Self = .es_BM
    static let es_BO: Self = .init(identifier: "es_BO")
    static let spanishBolivia: Self = .es_BO
    static let es_BQ: Self = .init(identifier: "es_BQ")
    static let spanishBonaire: Self = .es_BQ
    static let es_BR: Self = .init(identifier: "es_BR")
    static let spanishBrazil: Self = .es_BR
    static let es_BS: Self = .init(identifier: "es_BS")
    static let spanishBahamas: Self = .es_BS
    static let es_BZ: Self = .init(identifier: "es_BZ")
    static let spanishBelize: Self = .es_BZ
    static let es_CA: Self = .init(identifier: "es_CA")
    static let spanishCanada: Self = .es_CA
    static let es_CL: Self = .init(identifier: "es_CL")
    static let spanishChile: Self = .es_CL
    static let es_CO: Self = .init(identifier: "es_CO")
    static let spanishColombia: Self = .es_CO
    static let es_CR: Self = .init(identifier: "es_CR")
    static let spanishCostaRica: Self = .es_CR
    static let es_CU: Self = .init(identifier: "es_CU")
    static let spanishCuba: Self = .es_CU
    static let es_CW: Self = .init(identifier: "es_CW")
    static let spanishCuracao: Self = .es_CW
    static let es_DM: Self = .init(identifier: "es_DM")
    static let spanishDominica: Self = .es_DM
    static let es_DO: Self = .init(identifier: "es_DO")
    static let spanishDominicanRepublic: Self = .es_DO
    static let es_EA: Self = .init(identifier: "es_EA")
    static let spanishCeutaAndMelilla: Self = .es_EA
    static let es_EC: Self = .init(identifier: "es_EC")
    static let spanishEcuador: Self = .es_EC
    static let es_ES: Self = .init(identifier: "es_ES")
    static let spanishSpain: Self = .es_ES
    static let es_GD: Self = .init(identifier: "es_GD")
    static let spanishGrenada: Self = .es_GD
    static let es_GQ: Self = .init(identifier: "es_GQ")
    static let spanishEquatorialGuinea: Self = .es_GQ
    static let es_GT: Self = .init(identifier: "es_GT")
    static let spanishGuatemala: Self = .es_GT
    static let es_GY: Self = .init(identifier: "es_GY")
    static let spanishGuyana: Self = .es_GY
    static let es_HN: Self = .init(identifier: "es_HN")
    static let spanishHonduras: Self = .es_HN
    static let es_HT: Self = .init(identifier: "es_HT")
    static let spanishHaiti: Self = .es_HT
    static let es_IC: Self = .init(identifier: "es_IC")
    static let spanishCanaryIslands: Self = .es_IC
    static let es_KN: Self = .init(identifier: "es_KN")
    static let spanishSaintKittsAndNevis: Self = .es_KN
    static let es_KY: Self = .init(identifier: "es_KY")
    static let spanishCaymanIslands: Self = .es_KY
    static let es_LC: Self = .init(identifier: "es_LC")
    static let spanishSaintLucia: Self = .es_LC
    static let es_MX: Self = .init(identifier: "es_MX")
    static let spanishMexico: Self = .es_MX
    static let es_NI: Self = .init(identifier: "es_NI")
    static let spanishNicaragua: Self = .es_NI
    static let es_PA: Self = .init(identifier: "es_PA")
    static let spanishPanama: Self = .es_PA
    static let es_PE: Self = .init(identifier: "es_PE")
    static let spanishPeru: Self = .es_PE
    static let es_PH: Self = .init(identifier: "es_PH")
    static let spanishPhilippines: Self = .es_PH
    static let es_PR: Self = .init(identifier: "es_PR")
    static let spanishPuertoRico: Self = .es_PR
    static let es_PY: Self = .init(identifier: "es_PY")
    static let spanishParaguay: Self = .es_PY
    static let es_SV: Self = .init(identifier: "es_SV")
    static let spanishElSalvador: Self = .es_SV
    static let es_TC: Self = .init(identifier: "es_TC")
    static let spanishTurksAndCaicosIslands: Self = .es_TC
    static let es_TT: Self = .init(identifier: "es_TT")
    static let spanishTrinidadAndTobago: Self = .es_TT
    static let es_US: Self = .init(identifier: "es_US")
    static let spanishUS: Self = .es_US
    static let es_UY: Self = .init(identifier: "es_UY")
    static let spanishUruguay: Self = .es_UY
    static let es_VC: Self = .init(identifier: "es_VC")
    static let spanishSaintVincentAndGrenadines: Self = .es_VC
    static let es_VE: Self = .init(identifier: "es_VE")
    static let spanishVenezuela: Self = .es_VE
    static let es_VG: Self = .init(identifier: "es_VG")
    static let spanishBritishVirginIslands: Self = .es_VG
    static let es_VI: Self = .init(identifier: "es_VI")
    static let spanishUSVirginIslands: Self = .es_VI
    
    // Estonian
    static let et: Self = .init(identifier: "et")
    static let estonian: Self = .et
    static let et_EE: Self = .init(identifier: "et_EE")
    static let estonianEstonia: Self = .et_EE
    
    // Basque
    static let eu: Self = .init(identifier: "eu")
    static let basque: Self = .eu
    static let eu_ES: Self = .init(identifier: "eu_ES")
    static let basqueSpain: Self = .eu_ES
    
    // Persian
    static let fa: Self = .init(identifier: "fa")
    static let persian: Self = .fa
    static let fa_AF: Self = .init(identifier: "fa_AF")
    static let persianAfghanistan: Self = .fa_AF
    static let fa_IR: Self = .init(identifier: "fa_IR")
    static let persianIran: Self = .fa_IR
    
    // Finnish
    static let fi: Self = .init(identifier: "fi")
    static let finnish: Self = .fi
    static let fi_FI: Self = .init(identifier: "fi_FI")
    static let finnishFinland: Self = .fi_FI
    
    // French
    static let fr: Self = .init(identifier: "fr")
    static let french: Self = .fr
    static let fr_BE: Self = .init(identifier: "fr_BE")
    static let frenchBelgium: Self = .fr_BE
    static let fr_BF: Self = .init(identifier: "fr_BF")
    static let frenchBurkinaFaso: Self = .fr_BF
    static let fr_BI: Self = .init(identifier: "fr_BI")
    static let frenchBurundi: Self = .fr_BI
    static let fr_BJ: Self = .init(identifier: "fr_BJ")
    static let frenchBenin: Self = .fr_BJ
    static let fr_BL: Self = .init(identifier: "fr_BL")
    static let frenchSaintBarthelemy: Self = .fr_BL
    static let fr_CA: Self = .init(identifier: "fr_CA")
    static let frenchCanada: Self = .fr_CA
    static let fr_CD: Self = .init(identifier: "fr_CD")
    static let frenchCongo: Self = .fr_CD
    static let fr_CF: Self = .init(identifier: "fr_CF")
    static let frenchCentralAfricanRepublic: Self = .fr_CF
    static let fr_CG: Self = .init(identifier: "fr_CG")
    static let frenchRepublicOfCongo: Self = .fr_CG
    static let fr_CH: Self = .init(identifier: "fr_CH")
    static let frenchSwitzerland: Self = .fr_CH
    static let fr_CI: Self = .init(identifier: "fr_CI")
    static let frenchIvoryCoast: Self = .fr_CI
    static let fr_CM: Self = .init(identifier: "fr_CM")
    static let frenchCameroon: Self = .fr_CM
    static let fr_DJ: Self = .init(identifier: "fr_DJ")
    static let frenchDjibouti: Self = .fr_DJ
    static let fr_DZ: Self = .init(identifier: "fr_DZ")
    static let frenchAlgeria: Self = .fr_DZ
    static let fr_FR: Self = .init(identifier: "fr_FR")
    static let frenchFrance: Self = .fr_FR
    static let fr_GA: Self = .init(identifier: "fr_GA")
    static let frenchGabon: Self = .fr_GA
    static let fr_GF: Self = .init(identifier: "fr_GF")
    static let frenchFrenchGuiana: Self = .fr_GF
    static let fr_GN: Self = .init(identifier: "fr_GN")
    static let frenchGuinea: Self = .fr_GN
    static let fr_GP: Self = .init(identifier: "fr_GP")
    static let frenchGuadeloupe: Self = .fr_GP
    static let fr_GQ: Self = .init(identifier: "fr_GQ")
    static let frenchEquatorialGuinea: Self = .fr_GQ
    static let fr_HT: Self = .init(identifier: "fr_HT")
    static let frenchHaiti: Self = .fr_HT
    static let fr_KM: Self = .init(identifier: "fr_KM")
    static let frenchComoros: Self = .fr_KM
    static let fr_LU: Self = .init(identifier: "fr_LU")
    static let frenchLuxembourg: Self = .fr_LU
    static let fr_MA: Self = .init(identifier: "fr_MA")
    static let frenchMorocco: Self = .fr_MA
    static let fr_MC: Self = .init(identifier: "fr_MC")
    static let frenchMonaco: Self = .fr_MC
    static let fr_MF: Self = .init(identifier: "fr_MF")
    static let frenchSaintMartin: Self = .fr_MF
    static let fr_MG: Self = .init(identifier: "fr_MG")
    static let frenchMadagascar: Self = .fr_MG
    static let fr_ML: Self = .init(identifier: "fr_ML")
    static let frenchMali: Self = .fr_ML
    static let fr_MQ: Self = .init(identifier: "fr_MQ")
    static let frenchMartinique: Self = .fr_MQ
    static let fr_MR: Self = .init(identifier: "fr_MR")
    static let frenchMauritania: Self = .fr_MR
    static let fr_MU: Self = .init(identifier: "fr_MU")
    static let frenchMauritius: Self = .fr_MU
    static let fr_NC: Self = .init(identifier: "fr_NC")
    static let frenchNewCaledonia: Self = .fr_NC
    static let fr_NE: Self = .init(identifier: "fr_NE")
    static let frenchNiger: Self = .fr_NE
    static let fr_PF: Self = .init(identifier: "fr_PF")
    static let frenchFrenchPolynesia: Self = .fr_PF
    static let fr_PM: Self = .init(identifier: "fr_PM")
    static let frenchSaintPierre: Self = .fr_PM
    static let fr_RE: Self = .init(identifier: "fr_RE")
    static let frenchReunion: Self = .fr_RE
    static let fr_RW: Self = .init(identifier: "fr_RW")
    static let frenchRwanda: Self = .fr_RW
    static let fr_SC: Self = .init(identifier: "fr_SC")
    static let frenchSeychelles: Self = .fr_SC
    static let fr_SN: Self = .init(identifier: "fr_SN")
    static let frenchSenegal: Self = .fr_SN
    static let fr_SY: Self = .init(identifier: "fr_SY")
    static let frenchSyria: Self = .fr_SY
    static let fr_TD: Self = .init(identifier: "fr_TD")
    static let frenchChad: Self = .fr_TD
    static let fr_TG: Self = .init(identifier: "fr_TG")
    static let frenchTogo: Self = .fr_TG
    static let fr_TN: Self = .init(identifier: "fr_TN")
    static let frenchTunisia: Self = .fr_TN
    static let fr_VU: Self = .init(identifier: "fr_VU")
    static let frenchVanuatu: Self = .fr_VU
    static let fr_WF: Self = .init(identifier: "fr_WF")
    static let frenchWallisAndFutuna: Self = .fr_WF
    static let fr_YT: Self = .init(identifier: "fr_YT")
    static let frenchMayotte: Self = .fr_YT
    
    // Irish
    static let ga: Self = .init(identifier: "ga")
    static let irish: Self = .ga
    static let ga_IE: Self = .init(identifier: "ga_IE")
    static let irishIreland: Self = .ga_IE
    
    // Galician
    static let gl: Self = .init(identifier: "gl")
    static let galician: Self = .gl
    static let gl_ES: Self = .init(identifier: "gl_ES")
    static let galicianSpain: Self = .gl_ES
    
    // Gujarati
    static let gu: Self = .init(identifier: "gu")
    static let gujarati: Self = .gu
    static let gu_IN: Self = .init(identifier: "gu_IN")
    static let gujaratiIndia: Self = .gu_IN
    
    // Hausa
    static let ha: Self = .init(identifier: "ha")
    static let hausa: Self = .ha
    static let ha_GH: Self = .init(identifier: "ha_GH")
    static let hausaGhana: Self = .ha_GH
    static let ha_NE: Self = .init(identifier: "ha_NE")
    static let hausaNiger: Self = .ha_NE
    static let ha_NG: Self = .init(identifier: "ha_NG")
    static let hausaNigeria: Self = .ha_NG
    
    // Hebrew
    static let he: Self = .init(identifier: "he")
    static let hebrew: Self = .he
    static let he_IL: Self = .init(identifier: "he_IL")
    static let hebrewIsrael: Self = .he_IL
    
    // Hindi
    static let hi: Self = .init(identifier: "hi")
    static let hindi: Self = .hi
    static let hi_IN: Self = .init(identifier: "hi_IN")
    static let hindiIndia: Self = .hi_IN
    
    // Croatian
    static let hr: Self = .init(identifier: "hr")
    static let croatian: Self = .hr
    static let hr_BA: Self = .init(identifier: "hr_BA")
    static let croatianBosniaAndHerzegovina: Self = .hr_BA
    static let hr_HR: Self = .init(identifier: "hr_HR")
    static let croatianCroatia: Self = .hr_HR
    
    // Hungarian
    static let hu: Self = .init(identifier: "hu")
    static let hungarian: Self = .hu
    static let hu_HU: Self = .init(identifier: "hu_HU")
    static let hungarianHungary: Self = .hu_HU
    
    // Armenian
    static let hy: Self = .init(identifier: "hy")
    static let armenian: Self = .hy
    static let hy_AM: Self = .init(identifier: "hy_AM")
    static let armenianArmenia: Self = .hy_AM
    
    // Indonesian
    static let id: Self = .init(identifier: "id")
    static let indonesian: Self = .id
    static let id_ID: Self = .init(identifier: "id_ID")
    static let indonesianIndonesia: Self = .id_ID
    
    // Icelandic
    static let `is`: Self = .init(identifier: "is")
    static let icelandic: Self = .`is`
    static let is_IS: Self = .init(identifier: "is_IS")
    static let icelandicIceland: Self = .is_IS
    
    // Italian
    static let it: Self = .init(identifier: "it")
    static let italian: Self = .it
    static let it_CH: Self = .init(identifier: "it_CH")
    static let italianSwitzerland: Self = .it_CH
    static let it_IT: Self = .init(identifier: "it_IT")
    static let italianItaly: Self = .it_IT
    static let it_SM: Self = .init(identifier: "it_SM")
    static let italianSanMarino: Self = .it_SM
    static let it_VA: Self = .init(identifier: "it_VA")
    static let italianVaticanCity: Self = .it_VA
    
    // Japanese
    static let ja: Self = .init(identifier: "ja")
    static let japanese: Self = .ja
    static let ja_JP: Self = .init(identifier: "ja_JP")
    static let japaneseJapan: Self = .ja_JP
    
    // Georgian
    static let ka: Self = .init(identifier: "ka")
    static let georgian: Self = .ka
    static let ka_GE: Self = .init(identifier: "ka_GE")
    static let georgianGeorgia: Self = .ka_GE
    
    // Kazakh
    static let kk: Self = .init(identifier: "kk")
    static let kazakh: Self = .kk
    static let kk_KZ: Self = .init(identifier: "kk_KZ")
    static let kazakhKazakhstan: Self = .kk_KZ
    
    // Khmer
    static let km: Self = .init(identifier: "km")
    static let khmer: Self = .km
    static let km_KH: Self = .init(identifier: "km_KH")
    static let khmerCambodia: Self = .km_KH
    
    // Kannada
    static let kn: Self = .init(identifier: "kn")
    static let kannada: Self = .kn
    static let kn_IN: Self = .init(identifier: "kn_IN")
    static let kannadaIndia: Self = .kn_IN
    
    // Korean
    static let ko: Self = .init(identifier: "ko")
    static let korean: Self = .ko
    static let ko_KP: Self = .init(identifier: "ko_KP")
    static let koreanNorthKorea: Self = .ko_KP
    static let ko_KR: Self = .init(identifier: "ko_KR")
    static let koreanSouthKorea: Self = .ko_KR
    
    // Kyrgyz
    static let ky: Self = .init(identifier: "ky")
    static let kyrgyz: Self = .ky
    static let ky_KG: Self = .init(identifier: "ky_KG")
    static let kyrgyzKyrgyzstan: Self = .ky_KG
    
    // Lao
    static let lo: Self = .init(identifier: "lo")
    static let lao: Self = .lo
    static let lo_LA: Self = .init(identifier: "lo_LA")
    static let laoLaos: Self = .lo_LA
    
    // Lithuanian
    static let lt: Self = .init(identifier: "lt")
    static let lithuanian: Self = .lt
    static let lt_LT: Self = .init(identifier: "lt_LT")
    static let lithuanianLithuania: Self = .lt_LT
    
    // Latvian
    static let lv: Self = .init(identifier: "lv")
    static let latvian: Self = .lv
    static let lv_LV: Self = .init(identifier: "lv_LV")
    static let latvianLatvia: Self = .lv_LV
    
    // Macedonian
    static let mk: Self = .init(identifier: "mk")
    static let macedonian: Self = .mk
    static let mk_MK: Self = .init(identifier: "mk_MK")
    static let macedonianMacedonia: Self = .mk_MK
    
    // Malayalam
    static let ml: Self = .init(identifier: "ml")
    static let malayalam: Self = .ml
    static let ml_IN: Self = .init(identifier: "ml_IN")
    static let malayalamIndia: Self = .ml_IN
    
    // Mongolian
    static let mn: Self = .init(identifier: "mn")
    static let mongolian: Self = .mn
    static let mn_MN: Self = .init(identifier: "mn_MN")
    static let mongolianMongolia: Self = .mn_MN
    
    // Marathi
    static let mr: Self = .init(identifier: "mr")
    static let marathi: Self = .mr
    static let mr_IN: Self = .init(identifier: "mr_IN")
    static let marathiIndia: Self = .mr_IN
    
    // Malay
    static let ms: Self = .init(identifier: "ms")
    static let malay: Self = .ms
    static let ms_BN: Self = .init(identifier: "ms_BN")
    static let malayBrunei: Self = .ms_BN
    static let ms_ID: Self = .init(identifier: "ms_ID")
    static let malayIndonesia: Self = .ms_ID
    static let ms_MY: Self = .init(identifier: "ms_MY")
    static let malayMalaysia: Self = .ms_MY
    static let ms_SG: Self = .init(identifier: "ms_SG")
    static let malaySingapore: Self = .ms_SG
    
    // Maltese
    static let mt: Self = .init(identifier: "mt")
    static let maltese: Self = .mt
    static let mt_MT: Self = .init(identifier: "mt_MT")
    static let malteseMalta: Self = .mt_MT
    
    // Burmese
    static let my: Self = .init(identifier: "my")
    static let burmese: Self = .my
    static let my_MM: Self = .init(identifier: "my_MM")
    static let burmeseMyanmar: Self = .my_MM
    
    // Norwegian Bokmål
    static let nb: Self = .init(identifier: "nb")
    static let norwegianBokmål: Self = .nb
    static let nb_NO: Self = .init(identifier: "nb_NO")
    static let norwegianBokmålNorway: Self = .nb_NO
    static let nb_SJ: Self = .init(identifier: "nb_SJ")
    static let norwegianBokmålSvalbardAndJanMayen: Self = .nb_SJ
    
    // Northern Ndebele
    static let nd: Self = .init(identifier: "nd")
    static let northernNdebele: Self = .nd
    static let nd_ZW: Self = .init(identifier: "nd_ZW")
    static let northernNdebeleZimbabwe: Self = .nd_ZW
    
    // Nepali
    static let ne: Self = .init(identifier: "ne")
    static let nepali: Self = .ne
    static let ne_IN: Self = .init(identifier: "ne_IN")
    static let nepaliIndia: Self = .ne_IN
    static let ne_NP: Self = .init(identifier: "ne_NP")
    static let nepaliNepal: Self = .ne_NP
    
    // Dutch
    static let nl: Self = .init(identifier: "nl")
    static let dutch: Self = .nl
    static let nl_AW: Self = .init(identifier: "nl_AW")
    static let dutchAruba: Self = .nl_AW
    static let nl_BE: Self = .init(identifier: "nl_BE")
    static let dutchBelgium: Self = .nl_BE
    static let nl_BQ: Self = .init(identifier: "nl_BQ")
    static let dutchCaribbeanNetherlands: Self = .nl_BQ
    static let nl_CW: Self = .init(identifier: "nl_CW")
    static let dutchCuracao: Self = .nl_CW
    static let nl_NL: Self = .init(identifier: "nl_NL")
    static let dutchNetherlands: Self = .nl_NL
    static let nl_SR: Self = .init(identifier: "nl_SR")
    static let dutchSuriname: Self = .nl_SR
    static let nl_SX: Self = .init(identifier: "nl_SX")
    static let dutchSintMaarten: Self = .nl_SX
    
    // Norwegian Nynorsk
    static let nn: Self = .init(identifier: "nn")
    static let norwegianNynorsk: Self = .nn
    static let nn_NO: Self = .init(identifier: "nn_NO")
    static let norwegianNynorskNorway: Self = .nn_NO
    
    // Norwegian
    static let no: Self = .init(identifier: "no")
    static let norwegian: Self = .no
    
    // Oromo
    static let om: Self = .init(identifier: "om")
    static let oromo: Self = .om
    static let om_ET: Self = .init(identifier: "om_ET")
    static let oromoEthiopia: Self = .om_ET
    static let om_KE: Self = .init(identifier: "om_KE")
    static let oromoKenya: Self = .om_KE
    
    // Oriya
    static let or: Self = .init(identifier: "or")
    static let oriya: Self = .or
    static let or_IN: Self = .init(identifier: "or_IN")
    static let oriyaIndia: Self = .or_IN
    
    // Punjabi
    static let pa: Self = .init(identifier: "pa")
    static let punjabi: Self = .pa
    static let pa_Arab: Self = .init(identifier: "pa_Arab")
    static let punjabiArabic: Self = .pa_Arab
    static let pa_Arab_PK: Self = .init(identifier: "pa_Arab_PK")
    static let punjabiArabicPakistan: Self = .pa_Arab_PK
    static let pa_Guru: Self = .init(identifier: "pa_Guru")
    static let punjabiGurmukhi: Self = .pa_Guru
    static let pa_Guru_IN: Self = .init(identifier: "pa_Guru_IN")
    static let punjabiGurmukhiIndia: Self = .pa_Guru_IN
    
    // Polish
    static let pl: Self = .init(identifier: "pl")
    static let polish: Self = .pl
    static let pl_PL: Self = .init(identifier: "pl_PL")
    static let polishPoland: Self = .pl_PL
    
    // Portuguese
    static let pt: Self = .init(identifier: "pt")
    static let portuguese: Self = .pt
    static let pt_AO: Self = .init(identifier: "pt_AO")
    static let portugueseAngola: Self = .pt_AO
    static let pt_BR: Self = .init(identifier: "pt_BR")
    static let portugueseBrazil: Self = .pt_BR
    static let pt_CH: Self = .init(identifier: "pt_CH")
    static let portugueseSwitzerland: Self = .pt_CH
    static let pt_CV: Self = .init(identifier: "pt_CV")
    static let portugueseCapeVerde: Self = .pt_CV
    static let pt_FR: Self = .init(identifier: "pt_FR")
    static let portugueseFrance: Self = .pt_FR
    static let pt_GQ: Self = .init(identifier: "pt_GQ")
    static let portugueseEquatorialGuinea: Self = .pt_GQ
    static let pt_GW: Self = .init(identifier: "pt_GW")
    static let portugueseGuineaBissau: Self = .pt_GW
    static let pt_LU: Self = .init(identifier: "pt_LU")
    static let portugueseLuxembourg: Self = .pt_LU
    static let pt_MO: Self = .init(identifier: "pt_MO")
    static let portugueseMacau: Self = .pt_MO
    static let pt_MZ: Self = .init(identifier: "pt_MZ")
    static let portugueseMozambique: Self = .pt_MZ
    static let pt_PT: Self = .init(identifier: "pt_PT")
    static let portuguesePortugal: Self = .pt_PT
    static let pt_ST: Self = .init(identifier: "pt_ST")
    static let portugueseSaoTomeAndPrincipe: Self = .pt_ST
    static let pt_TL: Self = .init(identifier: "pt_TL")
    static let portugueseEastTimor: Self = .pt_TL
    
    // Quechua
    static let qu: Self = .init(identifier: "qu")
    static let quechua: Self = .qu
    static let qu_BO: Self = .init(identifier: "qu_BO")
    static let quechuaBolivia: Self = .qu_BO
    static let qu_EC: Self = .init(identifier: "qu_EC")
    static let quechuaEcuador: Self = .qu_EC
    static let qu_PE: Self = .init(identifier: "qu_PE")
    static let quechuaPeru: Self = .qu_PE
    
    // Romanian
    static let ro: Self = .init(identifier: "ro")
    static let romanian: Self = .ro
    static let ro_MD: Self = .init(identifier: "ro_MD")
    static let romanianMoldova: Self = .ro_MD
    static let ro_RO: Self = .init(identifier: "ro_RO")
    static let romanianRomania: Self = .ro_RO
    
    // Russian
    static let ru: Self = .init(identifier: "ru")
    static let russian: Self = .ru
    static let ru_BY: Self = .init(identifier: "ru_BY")
    static let russianBelarus: Self = .ru_BY
    static let ru_KG: Self = .init(identifier: "ru_KG")
    static let russianKyrgyzstan: Self = .ru_KG
    static let ru_KZ: Self = .init(identifier: "ru_KZ")
    static let russianKazakhstan: Self = .ru_KZ
    static let ru_MD: Self = .init(identifier: "ru_MD")
    static let russianMoldova: Self = .ru_MD
    static let ru_RU: Self = .init(identifier: "ru_RU")
    static let russianRussia: Self = .ru_RU
    static let ru_UA: Self = .init(identifier: "ru_UA")
    static let russianUkraine: Self = .ru_UA
    
    // Kinyarwanda
    static let rw: Self = .init(identifier: "rw")
    static let kinyarwanda: Self = .rw
    static let rw_RW: Self = .init(identifier: "rw_RW")
    static let kinyarwandaRwanda: Self = .rw_RW
    
    // Sanskrit
    static let sa: Self = .init(identifier: "sa")
    static let sanskrit: Self = .sa
    static let sa_IN: Self = .init(identifier: "sa_IN")
    static let sanskritIndia: Self = .sa_IN
    
    // Sindhi
    static let sd: Self = .init(identifier: "sd")
    static let sindhi: Self = .sd
    static let sd_PK: Self = .init(identifier: "sd_PK")
    static let sindhiPakistan: Self = .sd_PK
    
    // Northern Sami
    static let se: Self = .init(identifier: "se")
    static let northernSami: Self = .se
    static let se_FI: Self = .init(identifier: "se_FI")
    static let northernSamiFinland: Self = .se_FI
    static let se_NO: Self = .init(identifier: "se_NO")
    static let northernSamiNorway: Self = .se_NO
    static let se_SE: Self = .init(identifier: "se_SE")
    static let northernSamiSweden: Self = .se_SE
    
    // Sinhala
    static let si: Self = .init(identifier: "si")
    static let sinhala: Self = .si
    static let si_LK: Self = .init(identifier: "si_LK")
    static let sinhalaSriLanka: Self = .si_LK
    
    // Slovak
    static let sk: Self = .init(identifier: "sk")
    static let slovak: Self = .sk
    static let sk_SK: Self = .init(identifier: "sk_SK")
    static let slovakSlovakia: Self = .sk_SK
    
    // Slovenian
    static let sl: Self = .init(identifier: "sl")
    static let slovenian: Self = .sl
    static let sl_SI: Self = .init(identifier: "sl_SI")
    static let slovenianSlovenia: Self = .sl_SI
    
    // Somali
    static let so: Self = .init(identifier: "so")
    static let somali: Self = .so
    static let so_DJ: Self = .init(identifier: "so_DJ")
    static let somaliDjibouti: Self = .so_DJ
    static let so_ET: Self = .init(identifier: "so_ET")
    static let somaliEthiopia: Self = .so_ET
    static let so_KE: Self = .init(identifier: "so_KE")
    static let somaliKenya: Self = .so_KE
    static let so_SO: Self = .init(identifier: "so_SO")
    static let somaliSomalia: Self = .so_SO
    
    // Albanian
    static let sq: Self = .init(identifier: "sq")
    static let albanian: Self = .sq
    static let sq_AL: Self = .init(identifier: "sq_AL")
    static let albanianAlbania: Self = .sq_AL
    static let sq_MK: Self = .init(identifier: "sq_MK")
    static let albanianNorthMacedonia: Self = .sq_MK
    static let sq_XK: Self = .init(identifier: "sq_XK")
    static let albanianKosovo: Self = .sq_XK
    
    // Serbian
    static let sr: Self = .init(identifier: "sr")
    static let serbian: Self = .sr
    static let sr_BA: Self = .init(identifier: "sr_BA")
    static let serbianBosnia: Self = .sr_BA
    static let sr_Cyrl: Self = .init(identifier: "sr_Cyrl")
    static let serbianCyrillic: Self = .sr_Cyrl
    static let sr_Cyrl_BA: Self = .init(identifier: "sr_Cyrl_BA")
    static let serbianCyrillicBosnia: Self = .sr_Cyrl_BA
    static let sr_Cyrl_ME: Self = .init(identifier: "sr_Cyrl_ME")
    static let serbianCyrillicMontenegro: Self = .sr_Cyrl_ME
    static let sr_Cyrl_RS: Self = .init(identifier: "sr_Cyrl_RS")
    static let serbianCyrillicSerbia: Self = .sr_Cyrl_RS
    static let sr_Cyrl_XK: Self = .init(identifier: "sr_Cyrl_XK")
    static let serbianCyrillicKosovo: Self = .sr_Cyrl_XK
    static let sr_Latn: Self = .init(identifier: "sr_Latn")
    static let serbianLatin: Self = .sr_Latn
    static let sr_Latn_BA: Self = .init(identifier: "sr_Latn_BA")
    static let serbianLatinBosnia: Self = .sr_Latn_BA
    static let sr_Latn_ME: Self = .init(identifier: "sr_Latn_ME")
    static let serbianLatinMontenegro: Self = .sr_Latn_ME
    static let sr_Latn_RS: Self = .init(identifier: "sr_Latn_RS")
    static let serbianLatinSerbia: Self = .sr_Latn_RS
    static let sr_Latn_XK: Self = .init(identifier: "sr_Latn_XK")
    static let serbianLatinKosovo: Self = .sr_Latn_XK
    
    // Swati
    static let ss: Self = .init(identifier: "ss")
    static let swati: Self = .ss
    static let ss_SZ: Self = .init(identifier: "ss_SZ")
    static let swatiEswatini: Self = .ss_SZ
    static let ss_ZA: Self = .init(identifier: "ss_ZA")
    static let swatiSouthAfrica: Self = .ss_ZA
    
    // Sotho
    static let st: Self = .init(identifier: "st")
    static let sotho: Self = .st
    static let st_LS: Self = .init(identifier: "st_LS")
    static let sothoLesotho: Self = .st_LS
    static let st_ZA: Self = .init(identifier: "st_ZA")
    static let sothoSouthAfrica: Self = .st_ZA
    
    // Swedish
    static let sv: Self = .init(identifier: "sv")
    static let swedish: Self = .sv
    static let sv_AX: Self = .init(identifier: "sv_AX")
    static let swedishAlandIslands: Self = .sv_AX
    static let sv_FI: Self = .init(identifier: "sv_FI")
    static let swedishFinland: Self = .sv_FI
    static let sv_SE: Self = .init(identifier: "sv_SE")
    static let swedishSweden: Self = .sv_SE
    
    // Swahili
    static let sw: Self = .init(identifier: "sw")
    static let swahili: Self = .sw
    static let sw_CD: Self = .init(identifier: "sw_CD")
    static let swahiliCongo: Self = .sw_CD
    static let sw_KE: Self = .init(identifier: "sw_KE")
    static let swahiliKenya: Self = .sw_KE
    static let sw_TZ: Self = .init(identifier: "sw_TZ")
    static let swahiliTanzania: Self = .sw_TZ
    static let sw_UG: Self = .init(identifier: "sw_UG")
    static let swahiliUganda: Self = .sw_UG
    
    // Tamil
    static let ta: Self = .init(identifier: "ta")
    static let tamil: Self = .ta
    static let ta_IN: Self = .init(identifier: "ta_IN")
    static let tamilIndia: Self = .ta_IN
    static let ta_LK: Self = .init(identifier: "ta_LK")
    static let tamilSriLanka: Self = .ta_LK
    static let ta_MY: Self = .init(identifier: "ta_MY")
    static let tamilMalaysia: Self = .ta_MY
    static let ta_SG: Self = .init(identifier: "ta_SG")
    static let tamilSingapore: Self = .ta_SG
    
    // Telugu
    static let te: Self = .init(identifier: "te")
    static let telugu: Self = .te
    static let te_IN: Self = .init(identifier: "te_IN")
    static let teluguIndia: Self = .te_IN
    
    // Tajik
    static let tg: Self = .init(identifier: "tg")
    static let tajik: Self = .tg
    static let tg_TJ: Self = .init(identifier: "tg_TJ")
    static let tajikTajikistan: Self = .tg_TJ
    
    // Thai
    static let th: Self = .init(identifier: "th")
    static let thai: Self = .th
    static let th_TH: Self = .init(identifier: "th_TH")
    static let thaiThailand: Self = .th_TH
    
    // Tigrinya
    static let ti: Self = .init(identifier: "ti")
    static let tigrinya: Self = .ti
    static let ti_ER: Self = .init(identifier: "ti_ER")
    static let tigrinyaEritrea: Self = .ti_ER
    static let ti_ET: Self = .init(identifier: "ti_ET")
    static let tigrinyaEthiopia: Self = .ti_ET
    
    // Turkmen
    static let tk: Self = .init(identifier: "tk")
    static let turkmen: Self = .tk
    static let tk_TM: Self = .init(identifier: "tk_TM")
    static let turkmenTurkmenistan: Self = .tk_TM
    
    // Tongan
    static let to: Self = .init(identifier: "to")
    static let tongan: Self = .to
    static let to_TO: Self = .init(identifier: "to_TO")
    static let tonganTonga: Self = .to_TO
    
    // Turkish
    static let tr: Self = .init(identifier: "tr")
    static let turkish: Self = .tr
    static let tr_CY: Self = .init(identifier: "tr_CY")
    static let turkishCyprus: Self = .tr_CY
    static let tr_TR: Self = .init(identifier: "tr_TR")
    static let turkishTurkey: Self = .tr_TR
    
    // Tatar
    static let tt: Self = .init(identifier: "tt")
    static let tatar: Self = .tt
    static let tt_RU: Self = .init(identifier: "tt_RU")
    static let tatarRussia: Self = .tt_RU
    
    // Uyghur
    static let ug: Self = .init(identifier: "ug")
    static let uyghur: Self = .ug
    static let ug_CN: Self = .init(identifier: "ug_CN")
    static let uyghurChina: Self = .ug_CN
    
    // Ukrainian
    static let uk: Self = .init(identifier: "uk")
    static let ukrainian: Self = .uk
    static let uk_UA: Self = .init(identifier: "uk_UA")
    static let ukrainianUkraine: Self = .uk_UA
    
    // Urdu
    static let ur: Self = .init(identifier: "ur")
    static let urdu: Self = .ur
    static let ur_IN: Self = .init(identifier: "ur_IN")
    static let urduIndia: Self = .ur_IN
    static let ur_PK: Self = .init(identifier: "ur_PK")
    static let urduPakistan: Self = .ur_PK
    
    // Uzbek
    static let uz: Self = .init(identifier: "uz")
    static let uzbek: Self = .uz
    static let uz_Arab: Self = .init(identifier: "uz_Arab")
    static let uzbekArabic: Self = .uz_Arab
    static let uz_Arab_AF: Self = .init(identifier: "uz_Arab_AF")
    static let uzbekArabicAfghanistan: Self = .uz_Arab_AF
    static let uz_Cyrl: Self = .init(identifier: "uz_Cyrl")
    static let uzbekCyrillic: Self = .uz_Cyrl
    static let uz_Cyrl_UZ: Self = .init(identifier: "uz_Cyrl_UZ")
    static let uzbekCyrillicUzbekistan: Self = .uz_Cyrl_UZ
    static let uz_Latn: Self = .init(identifier: "uz_Latn")
    static let uzbekLatin: Self = .uz_Latn
    static let uz_Latn_UZ: Self = .init(identifier: "uz_Latn_UZ")
    static let uzbekLatinUzbekistan: Self = .uz_Latn_UZ
    
    // Vietnamese
    static let vi: Self = .init(identifier: "vi")
    static let vietnamese: Self = .vi
    static let vi_VN: Self = .init(identifier: "vi_VN")
    static let vietnameseVietnam: Self = .vi_VN
    
    // Wolof
    static let wo: Self = .init(identifier: "wo")
    static let wolof: Self = .wo
    static let wo_SN: Self = .init(identifier: "wo_SN")
    static let wolofSenegal: Self = .wo_SN
    
    // Xhosa
    static let xh: Self = .init(identifier: "xh")
    static let xhosa: Self = .xh
    static let xh_ZA: Self = .init(identifier: "xh_ZA")
    static let xhosaSouthAfrica: Self = .xh_ZA
    
    // Yoruba
    static let yo: Self = .init(identifier: "yo")
    static let yoruba: Self = .yo
    static let yo_BJ: Self = .init(identifier: "yo_BJ")
    static let yorubaBenin: Self = .yo_BJ
    static let yo_NG: Self = .init(identifier: "yo_NG")
    static let yorubaNigeria: Self = .yo_NG
    
    // Chinese
    static let zh: Self = .init(identifier: "zh")
    static let chinese: Self = .zh
    static let zh_Hans: Self = .init(identifier: "zh_Hans")
    static let chineseSimplified: Self = .zh_Hans
    static let zh_Hans_CN: Self = .init(identifier: "zh_Hans_CN")
    static let chineseSimplifiedChina: Self = .zh_Hans_CN
    static let zh_Hans_HK: Self = .init(identifier: "zh_Hans_HK")
    static let chineseSimplifiedHongKong: Self = .zh_Hans_HK
    static let zh_Hans_MO: Self = .init(identifier: "zh_Hans_MO")
    static let chineseSimplifiedMacau: Self = .zh_Hans_MO
    static let zh_Hans_SG: Self = .init(identifier: "zh_Hans_SG")
    static let chineseSimplifiedSingapore: Self = .zh_Hans_SG
    static let zh_Hant: Self = .init(identifier: "zh_Hant")
    static let chineseTraditional: Self = .zh_Hant
    static let zh_Hant_HK: Self = .init(identifier: "zh_Hant_HK")
    static let chineseTraditionalHongKong: Self = .zh_Hant_HK
    static let zh_Hant_MO: Self = .init(identifier: "zh_Hant_MO")
    static let chineseTraditionalMacau: Self = .zh_Hant_MO
    static let zh_Hant_TW: Self = .init(identifier: "zh_Hant_TW")
    static let chineseTraditionalTaiwan: Self = .zh_Hant_TW
    
    // Zulu
    static let zu: Self = .init(identifier: "zu")
    static let zulu: Self = .zu
    static let zu_ZA: Self = .init(identifier: "zu_ZA")
    static let zuluSouthAfrica: Self = .zu_ZA
}
