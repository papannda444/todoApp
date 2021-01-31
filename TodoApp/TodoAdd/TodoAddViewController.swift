//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import UIKit

protocol TodoAddViewControllerDelegate: AnyObject {
    func addViewController(_ addView: TodoAddViewController, appendingTodo todo: String)
    func addViewControllerCancelButtonClicked(_ addView: TodoAddViewController)
}

class TodoAddViewController: UIViewController {
    @IBOutlet private var todoTextField: UITextField!

    weak var delegate: TodoAddViewControllerDelegate?
    private var presenter: TodoAddPresenterInput!

    func inject(presenter: TodoAddPresenterInput) {
        self.presenter = presenter
    }

    @IBAction private func cancel(_ sender: UIButton) {
        delegate?.addViewControllerCancelButtonClicked(self)
    }

    @IBAction private func complete(_ sender: UIButton) {
        guard let todo = todoTextField.text else { return }

        presenter.didTapCompleteButton(appendingTodo: todo)
        delegate?.addViewController(self, appendingTodo: todo)
    }
}

extension TodoAddViewController: TodoAddPresenterOutput {}
