//
//  PersonalDataViewModel.swift
//  RxMVVM
//
//  Created by Matias Gualino on 10/12/2018.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import Foundation
import RxSwift

class PersonalDataViewModel {
    
    var personName: String! {
        get {
            return "\(self.person.firstName) \(self.person.lastName)"
        }
    }
    
    var personAge = PublishSubject<Int>()
    var isOlder = PublishSubject<Bool>()
    
    fileprivate var person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    @objc func continueButtonTapped() {
        self.person.yearOfBirth = self.person.yearOfBirth - 1
        
        let age = 2018 - self.person.yearOfBirth
        
        self.personAge.onNext(age)
        self.isOlder.onNext(age >= 18)
    }
}
