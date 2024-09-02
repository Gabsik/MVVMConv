//
//  MainViewModele.swift
//  converter
//
//  Created by User on 28.08.2024.
//

import Foundation

// Протокол для делегирования обновлений из ViewModel в ViewController
protocol CurrencyConverterViewModelDelegate: AnyObject {
    func didUpdateConversion(result: String)  // Метод для обновления результата конвертации
}
class CurrencyConverterViewModel {
    weak var delegate: CurrencyConverterViewModelDelegate?
    private var exchangeRate: ExchangeRate? {
        didSet {
            calculateConversion()  // Пересчитываем конвертацию при обновлении курса
        }
    }
    private var amount: Double = 0.0 {
        didSet {
            calculateConversion()  // Пересчитываем конвертацию при изменении суммы
        }
    }
    // Метод для установки суммы, которую нужно конвертировать
    func setAmount(_ amount: Double) {
        self.amount = amount
    }
    // Метод для обновления курса валют
    func updateExchangeRate(from: Currency, to: Currency, rate: Double) {
        self.exchangeRate = ExchangeRate(from: from, to: to, rate: rate)
    }
    // Приватный метод для расчета конвертации
    private func calculateConversion() {
        guard let exchangeRate = exchangeRate else { return }  // Проверяем, установлен ли курс
        let result = amount * exchangeRate.rate  // Пересчитываем сумму
        let resultString = String(format: "%.2f", result)  // Форматируем результат с двумя знаками после запятой
        delegate?.didUpdateConversion(result: "\(amount) \(exchangeRate.from.code) = \(resultString) \(exchangeRate.to.code)")
    }
}
