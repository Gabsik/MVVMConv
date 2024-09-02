//
//  MainViewExtension.swift
//  converter
//
//  Created by User on 01.09.2024.
//

import UIKit

extension MainView {
    func makeResultLabel() -> UILabel {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .right
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    func makeButtonStackView() -> UIStackView {
        let buttons: [[UIButton]] = [
            ["7", "8", "9"].map { createButton(title: $0) },
            ["4", "5", "6"].map { createButton(title: $0) },
            ["1", "2", "3"].map { createButton(title: $0) },
            ["0", ".", "C"].map { createButton(title: $0) }
        ]
        // Создаем вертикальный stack view, который будет содержать строки кнопок
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for row in buttons {
            // Создаем горизонтальный stack view для каждой строки кнопок
            let rowStackView = UIStackView(arrangedSubviews: row)
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            stackView.addArrangedSubview(rowStackView)
        }
        
        return stackView
    }
    private func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        //button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        return button
    }
}
