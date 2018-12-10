//
//  PersonalDataView.swift
//  RxMVVM
//
//  Created by Matias Gualino on 10/12/2018.
//  Copyright © 2018 Matias Gualino. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class PersonalDataView {
    
    var viewModel: PersonalDataViewModel! {
        didSet {
            self.setup()
            self.bind()
        }
    }
    
    var bag = DisposeBag()
    
    fileprivate var containerView: UIView
    
    init(containerView: UIView) {
        self.containerView = containerView
    }
    
    fileprivate func setup() {
        self.prepareNameLabel()
        self.prepareAgeLabel()
        self.prepareContinueButton()
    }
    
    fileprivate func bind() {
        self.nameLabel.text = self.viewModel.personName
        
        self.viewModel.isOlder
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                [weak self] isOlder in
                if let strongSelf = self {
                    strongSelf.ageLabel?.textColor = isOlder ? UIColor.green : UIColor.red
                }
        }).disposed(by: self.bag)
        
        self.viewModel.personAge
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                [weak self] age in
                if let strongSelf = self {
                    strongSelf.ageLabel?.text = "\(age)"
                }
            }).disposed(by: self.bag)
    }
    
    fileprivate var nameLabel: UILabel!
    fileprivate func prepareNameLabel() {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            ])
        
        self.nameLabel = nameLabel
    }
    
    fileprivate var ageLabel: UILabel!
    fileprivate func prepareAgeLabel() {
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20),
            ])
        
        self.ageLabel = ageLabel
    }
    
    fileprivate var continueButton: UIButton!
    fileprivate func prepareContinueButton() {
        let continueButton = UIButton()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            continueButton.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            continueButton.widthAnchor.constraint(equalTo: self.containerView.widthAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            ])
        
        continueButton.setTitle("SIGUIENTE", for: .normal)
        continueButton.setTitleColor(UIColor.black, for: .normal)
        continueButton.backgroundColor = UIColor.lightGray
        continueButton.addTarget(self.viewModel, action: #selector(self.viewModel.continueButtonTapped), for: .touchUpInside)
        
        self.continueButton = continueButton
    }
    
}
