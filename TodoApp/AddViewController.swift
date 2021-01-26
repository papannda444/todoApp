import UIKit

class AddViewController: UIViewController {
    @IBOutlet private var todoTextField: UITextField!

    var todoList: [String] = []

    @IBAction private func cancel(_ sender: UIButton) {
        dismiss(animated: true)
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
        dismiss(animated: true)
    }
}
