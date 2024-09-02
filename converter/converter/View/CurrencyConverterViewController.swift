//
//  ViewController.swift
//  converter
//
//  Created by User on 28.08.2024.
//

import UIKit

class CurrencyConverterViewController: UIViewController, CurrencyConverterViewModelDelegate{
    private var mainView = MainView()
    private let viewModel = CurrencyConverterViewModel()  // Создаем экземпляр ViewModel
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self  // Устанавливаем делегат ViewModel
        setupInitialData()  // Инициализация начальных данных
        setup()
    }
    private func setupInitialData() {
        let usd = Currency(code: "USD", name: "United States Dollar")  // Создаем валюту USD
        let eur = Currency(code: "EUR", name: "Euro")  // Создаем валюту EUR
        viewModel.updateExchangeRate(from: usd, to: eur, rate: 0.85)  // Устанавливаем начальный курс USD -> EUR
    }
    @IBAction func amountTextFieldChanged(_ sender: UITextField) {
        if let text = sender.text, let amount = Double(text) {
            viewModel.setAmount(amount)  // Обновляем сумму в ViewModel
        }
    }
    func didUpdateConversion(result: String) {
        //resultLabel.text = result  // Обновляем результат на экране
    }
    func setup() {
        mainView = MainView()
        mainView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        mainView.center = view.center
        mainView.backgroundColor = .red
        view.addSubview(mainView)
    }
}
