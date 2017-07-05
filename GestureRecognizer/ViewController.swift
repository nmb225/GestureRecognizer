

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        statusLabel.text = "TAP DETECTED"
        self.view.backgroundColor = UIColor.white
        statusLabel.textColor = UIColor.black
    }
    
    @IBAction func longPressDetected(_ sender: UILongPressGestureRecognizer) {
        statusLabel.text = "LONG PRESS DETECTED"
        self.view.backgroundColor = UIColor.green
        statusLabel.textColor = UIColor.white
    }
}

