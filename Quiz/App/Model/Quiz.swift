//
//  Quiz.swift
//  Quiz
//
//  Created by Denis Voropanov on 23.07.2022.
//

struct Question {
    var text: String
    var type: ResponseType
    var answer: [Answer]
    
    static var all: [Question] = [
        Question(text: "Для чего используется цикл простого дросселирования?", type: .single, answer: [
            Answer(text: "Для ожижения всех газов.", type: .four),
            Answer(text: "Для ожижения всех газов, кроме водорода неона и гелия.", type: .five),
            Answer(text: "Для охлаждения жидкости.", type: .three),
            Answer(text: "Для нагревания газа.", type: .two),
        ]),
        Question(text: "Приблизительно отметьте температуру кипения кислорода (при 1 атм).", type: .range, answer: [
            Answer(text: "12 K", type: .two),
            Answer(text: "44 K", type: .two),
            Answer(text: "85 K", type: .four),
            Answer(text: "91 K", type: .five),
        ]),
        Question(text: "Какие бы слова Вы записали в пустой ячейке?", type: .multiply, answer: [
            Answer(text: "Сублимация", type: .five),
            Answer(text: "Возгонка", type: .four),
            Answer(text: "Десублимация", type: .three),
            Answer(text: "Конденсация", type: .two),
        ]),
        Question(text: "Приблизительно отметьте температуру кипения азота (при 1 атм).", type: .range, answer: [
            Answer(text: "23 K", type: .two),
            Answer(text: "77 K", type: .five),
            Answer(text: "83 K", type: .three),
            Answer(text: "105 K", type: .two),
        ]),
        Question(text: "Дайте определение крионосителю?", type: .single, answer: [
            Answer(text: "Рабочее вещество, используемое в низкотемпературной установке.", type: .four),
            Answer(text: "Вещество, которое переносит теплоту от охлаждаемого тела к криоагенту.", type: .five),
            Answer(text: "Вещество, выводимое из криогенной установки.", type: .two),
            Answer(text: "Вещество, необходимое для нагревания газа.", type: .two),
        ]),
    ]
}

