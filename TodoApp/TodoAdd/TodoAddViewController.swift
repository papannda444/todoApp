//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import UIKit

class TodoAddViewController: UIViewController {
    @IBOutlet private var todoTextField: UITextField!

    private var presenter: TodoAddPresenterInput!

    func inject(presenter: TodoAddPresenterInput) {
        self.presenter = presenter
    }

    @IBAction private func cancel(_ sender: UIButton) {
        presenter.didTapCancelButton()
    }

    @IBAction private func complete(_ sender: UIButton) {
        guard let todo = todoTextField.text else { return }

        presenter.didTapCompleteButton(appendingTodo: todo)
    }
}

extension TodoAddViewController: TodoAddPresenterOutput {}
