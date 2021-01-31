//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import UIKit

final class TodoListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    private var presenter: TodoListPresenterInput!
    func inject(presenter: TodoListPresenterInput) {
        self.presenter = presenter
    }

    @IBAction private func add(_ sender: UIBarButtonItem) {
        presenter.didTapAddButton()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfTodos
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        todoCell.textLabel?.text = presenter.todos(forRow: indexPath.row)
        return todoCell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }

        presenter.deleteTodos(forRow: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension TodoListViewController: TodoListPresenterOutput {
    func todoAddDidEndAppending() {
        dismiss(animated: true)
    }

    func updateTodos(appendingTodo todo: String) {
        tableView.reloadData()
    }

    func transitionToTodoAdd<T: TodoAddDelegate>(_ delegate: T?) {
        guard let addViewController = UIStoryboard(name: "TodoAddViewController",
                                                   bundle: nil)
                .instantiateInitialViewController() as? TodoAddViewController else {
            return
        }

        let addPresenter = TodoAddPresenter(view: addViewController)
        addPresenter.delegate = delegate
        addViewController.inject(presenter: addPresenter)
        present(addViewController, animated: true)
    }
}
