import CoreData
import UIKit

class InputController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        inputField.delegate = self
    }
    @IBAction func submitTask(_ sender: Any)
    {
        guard inputField.text != "" else {return}
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let newTask = Task(context: context)
        newTask.name = inputField.text
        
        delegate.saveContext()
        inputField.text = ""
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
