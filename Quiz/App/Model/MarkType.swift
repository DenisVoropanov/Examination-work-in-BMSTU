//
//  AnimalType.swift
//  Quiz
//
//  Created by Denis Voropanov on 23.07.2022.
//

enum MarkType: String {
    case five = "Ваша оценка: 5",
         four = "Ваша оценка: 4",
         three = "Ваша оценка: 3",
         two = "Ваша оценка: 2"
    
    var definition: String {
        switch self {
        case .five:
            return "Поздравляем с отличным результатом!"
        case .four:
            return "Хороший результатат!"
        case .three:
            return "Рубежный контроль сдан!"
        case .two:
            return "Ждем Вас на пересдаче!"
        }
    }
}

