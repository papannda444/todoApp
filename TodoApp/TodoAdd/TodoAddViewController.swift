//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import UIKit

class TodoAddViewController: UIViewController {
    @IBOutlet private var todoTextField: UITextField!
    @IBOutlet private var completeButton: UIButton!

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

    @IBAction private func edit(_ sender: UITextField) {
        presenter.didEditTextField(withText: sender.text)
    }
}

extension TodoAddViewController: TodoAddPresenterOutput {
    func enableCompleteButton(_ isEnabled: Bool) {
        completeButton.isEnabled = isEnabled
    }
}

extension TodoAddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
