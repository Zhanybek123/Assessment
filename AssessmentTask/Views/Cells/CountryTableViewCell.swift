//
//  CityTableViewCell.swift
//  AssessmentTask
//
//  Created by zhanybek salgarin on 7/26/23.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    static let id = "CityTableViewCell"

    var countryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "USA"
        return label
    }()
    
    var countryRegionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Washington"
        return label
    }()
    
    var countryCodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "253"
        return label
    }()
    
    var countryCapitalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Seattle"
        return label
    }()
    
    func setLayouts() {
        [ countryNameLabel, countryRegionLabel, countryCodeLabel, countryCapitalLabel ].forEach { property in
            contentView.addSubview(property)
            property.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            countryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            countryNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            countryNameLabel.widthAnchor.constraint(equalToConstant: bounds.width / 3),
            countryNameLabel.heightAnchor.constraint(equalToConstant: bounds.height / 2),
            
            countryRegionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            countryRegionLabel.leftAnchor.constraint(equalTo: countryNameLabel.rightAnchor, constant: 8),
            countryRegionLabel.widthAnchor.constraint(equalToConstant: bounds.width / 3),
            countryRegionLabel.heightAnchor.constraint(equalToConstant: bounds.height / 2),
            
            countryCodeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            countryCodeLabel.leftAnchor.constraint(equalTo: countryRegionLabel.rightAnchor, constant: 8),
            countryCodeLabel.widthAnchor.constraint(equalToConstant: bounds.width / 3),
            countryCodeLabel.heightAnchor.constraint(equalToConstant: bounds.height / 2),
            
            countryCapitalLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 8),
            countryCapitalLabel.leftAnchor.constraint(equalTo: countryNameLabel.leftAnchor),
            countryCapitalLabel.widthAnchor.constraint(equalToConstant: bounds.width / 3),
            countryCapitalLabel.heightAnchor.constraint(equalToConstant: bounds.height / 2),
        ])
    }
    
    func configureProperties(with model: CountryModelToPopulate) {
        self.countryNameLabel.text = model.country
        self.countryCapitalLabel.text = model.capital
        self.countryRegionLabel.text = model.region
        self.countryCodeLabel.text = model.code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayouts()
//        configureProperties(with: CountryModelToPopulate)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
