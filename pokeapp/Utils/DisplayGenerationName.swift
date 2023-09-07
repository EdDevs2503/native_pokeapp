//
//  DisplayGenerationName.swift
//  pokeapp
//
//  Created by Edisson Mata on 26/8/23.
//

import Foundation

func DisplayGenerationName (_ generationName: String) -> String {
    let stringParts = generationName.components(separatedBy: "-")
    return stringParts[0].capitalizedSentence + " " + stringParts[1].uppercased()
}
