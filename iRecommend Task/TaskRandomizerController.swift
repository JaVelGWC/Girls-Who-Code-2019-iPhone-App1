import UIKit

class TaskRandomizerController: UIViewController
{
    @IBOutlet weak var mainIMG: UIImageView!
    
    let taskItems = ["Bake", "Beach", "Board Game", "Garden", "hiking", "Movie" , "Paint", "poker", "Read", "Theme Park"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setRandomItem()
    }
    func setRandomItem()
    {
        guard let item = taskItems.randomElement() else {return}
        mainIMG.image = UIImage(named: item)
    }
    
    @IBAction func randomize(_ sender: Any)
    {
        setRandomItem()
    }

}
