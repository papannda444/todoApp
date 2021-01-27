import UIKit

final class TodoListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    private var presenter: TodoListPresenterInput!
    func inject(presenter: TodoListPresenterInput) {
        self.presenter = presenter
    }

    @IBAction private func add(_ sender: UIBarButtonItem) {
        guard let addViewController = UIStoryboard(name: "TodoAddViewController",
                                                   bundle: nil)
                .instantiateInitialViewController() as? TodoAddViewController else {
            return
        }
        addViewController.delegate = self
        present(addViewController, animated: true)
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

extension TodoListViewController: TodoAddViewControllerDelegate {
    func addViewController(_ addView: TodoAddViewController, appendingTodo todo: String) {
        dismiss(animated: true)
        tableView.reloadData()
    }

    func addViewControllerCancelButtonClicked(_ addView: TodoAddViewController) {
        dismiss(animated: true)
    }
}

extension TodoListViewController: TodoListPresenterOutput {
}
