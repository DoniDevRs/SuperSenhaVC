//
//  PasswordGenerator.swift
//  SuperSenhaVC
//
//  Created by Doni Silva on 27/05/21.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvxz"
    private let numbers = "1234567890"
    private let specialCharacters = "!@#$%ˆ&*()"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        var numchars = min(numberOfCharacters,16)
        numchars = max(numchars,1)
        
        self.numberOfCharacters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String]{
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters{
            universe += specialCharacters
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password: String = ""
            for _ in 1...numberOfCharacters{
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
