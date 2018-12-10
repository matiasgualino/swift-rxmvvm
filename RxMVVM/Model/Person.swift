//
//  Person.swift
//  RxMVVM
//
//  Created by Matias Gualino on 10/12/2018.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import Foundation

class Person {
    var firstName: String
    var lastName: String
    var yearOfBirth: Int
    
    init(firstName: String, lastName: String, yearOfBirth: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
    }
}
