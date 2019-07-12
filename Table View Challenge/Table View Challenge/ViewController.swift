import UIKit

class ViewController: UIViewController, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    
    var animalName = ["Elephant", "Penguin", "Shark", "Dolphin", "Lion"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animalName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        cell.textLabel?.text = animalName[indexPath.row]
        return cell
    }
}

