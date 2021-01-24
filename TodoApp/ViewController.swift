import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // リストの行数決め
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let todoList = UserDefaults.standard.array(forKey: "todoList") {
            return todoList.count
        }
        return 1
    }

    // リスト表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        if let todoTexts = UserDefaults.standard.stringArray(forKey: "todoList") {
            todoCell.textLabel?.text = todoTexts[indexPath.row]
        }
        return todoCell
    }

    // 削除処理
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }

        if var todoList = UserDefaults.standard.stringArray(forKey: "todoList") {
            todoList.remove(at: indexPath.row)
            UserDefaults.standard.set(todoList, forKey: "todoList")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
