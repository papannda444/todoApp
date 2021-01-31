//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import Foundation

protocol TodoAddPresenterInput {
    func didTapCompleteButton(appendingTodo todo: String)
}

protocol TodoAddPresenterOutput: AnyObject {}

final class TodoAddPresenter {
    private weak var view: TodoAddPresenterOutput!

    init(view: TodoAddPresenterOutput) {
        self.view = view
    }
}

extension TodoAddPresenter: TodoAddPresenterInput {
    func didTapCompleteButton(appendingTodo todo: String) {
        var todoList = UserDefaults.standard.stringArray(forKey: "todos") ?? []
        todoList.append(todo)
        UserDefaults.standard.setValue(todoList, forKey: "todos")
    }
}
