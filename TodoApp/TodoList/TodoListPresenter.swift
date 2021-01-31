//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import Foundation

protocol TodoListPresenterInput {
    var numberOfTodos: Int { get }
    func todos(forRow row: Int) -> String?
    func deleteTodos(forRow row: Int)
}

protocol TodoListPresenterOutput: AnyObject {
}

final class TodoListPresenter {
    private var todos: [String] {
        get {
            UserDefaults.standard.stringArray(forKey: "todos") ?? []
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "todos")
        }
    }

    private weak var view: TodoListPresenterOutput!

    init(view: TodoListPresenterOutput) {
        self.view = view
    }
}

extension TodoListPresenter: TodoListPresenterInput {
    var numberOfTodos: Int {
        todos.count
    }

    func todos(forRow row: Int) -> String? {
        guard row < todos.count else { return nil }
        return todos[row]
    }

    func deleteTodos(forRow row: Int) {
        guard row < todos.count else { return }
        todos.remove(at: row)
    }
}
