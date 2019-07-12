import CoreData
import UIKit

class tableViewController: UITableViewController
{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks: [Task] = []
    
    func getData()
    {
        do
        {
            //try do this if it works keep going else catch
            tasks = try context.fetch(Task.fetchRequest())
            
            DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }
        }
        catch
        {
            print("XCode if broken and could not get data")
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        getData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        let task = self.tasks[indexPath.row]
        self.context.delete(task)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

}
