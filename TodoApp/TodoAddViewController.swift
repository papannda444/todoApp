import UIKit

protocol TodoAddViewControllerDelegate: AnyObject {
    func addViewController(_ addView: TodoAddViewController, appendingTodo todo: String)
    func addViewControllerCancelButtonClicked(_ addView: TodoAddViewController)
}

class TodoAddViewController: UIViewController {
    @IBOutlet private var todoTextField: UITextField!

    weak var delegate: TodoAddViewControllerDelegate?
    var todoList: [String] = []

    @IBAction private func cancel(_ sender: UIButton) {
        delegate?.addViewControllerCancelButtonClicked(self)
    }

    @IBAction private func complete(_ sender: Any) {
        // 何も入力されていなければ処理しない
        guard let todoText = todoTextField.text else {
            return
        }
        if todoText.isEmpty {
            return
        }
        todoTextField.text = ""

        // 何も登録されていなければUDに値を直接代入
        if var todoList = UserDefaults.standard.stringArray(forKey: "todoList") {
            todoList.append(todoText)
            UserDefaults.standard.set(todoList, forKey: "todoList")
        } else {
            UserDefaults.standard.set([todoText], forKey: "todoList")
        }

        delegate?.addViewController(self, appendingTodo: todoText)
    }
}
