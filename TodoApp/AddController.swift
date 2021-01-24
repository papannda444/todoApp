import UIKit

class AddController: UIViewController {
    @IBOutlet private var todoTextField: UITextField!
    var todoList: [String] = []

    @IBAction private func todoAddButton(_ sender: Any) {
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
    }
}
