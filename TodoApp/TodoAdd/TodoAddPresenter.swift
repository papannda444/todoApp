//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import Foundation

protocol TodoAddPresenterInput {
    func didTapCancelButton()
    func didTapCompleteButton(appendingTodo todo: String)
    func didEditTextField(withText text: String?)
}

protocol TodoAddPresenterOutput: AnyObject {
    func enableCompleteButton(_ isEnabled: Bool)
}

// モーダル表示をしているVC(Presenter)に状態を通知する
protocol TodoAddDelegate: AnyObject {
    func todoAddDidCancel()
    func todoAddDidComplete(appendingTodo todo: String)
}

final class TodoAddPresenter {
    private weak var view: TodoAddPresenterOutput!
    weak var delegate: TodoAddDelegate?

    init(view: TodoAddPresenterOutput) {
        self.view = view
    }
}

extension TodoAddPresenter: TodoAddPresenterInput {
    func didTapCancelButton() {
        delegate?.todoAddDidCancel()
    }

    func didTapCompleteButton(appendingTodo todo: String) {
        guard !todo.trimmingCharacters(in: .whitespaces).isEmpty else { return }

        var todoList = UserDefaults.standard.stringArray(forKey: "todos") ?? []
        todoList.append(todo)
        UserDefaults.standard.setValue(todoList, forKey: "todos")

        delegate?.todoAddDidComplete(appendingTodo: todo)
    }

    func didEditTextField(withText text: String?) {
        if let text = text, text.trimmingCharacters(in: .whitespaces).isEmpty {
            view.enableCompleteButton(false)
        } else {
            view.enableCompleteButton(true)
        }
    }
}
