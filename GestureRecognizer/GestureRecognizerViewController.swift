import UIKit

class GestureRecognizerViewController: UIViewController {
    
    
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapWasDetected(_ sender: UITapGestureRecognizer) {
        statusLabel.text = "DOUBLE TAP"
    }
    
    @IBAction func longPressWasDetected(_ sender: UILongPressGestureRecognizer) {
        statusLabel.text = "TRIPLE LONG PRESS"
    }
    
    @IBAction func swipeWasDetected(_ sender: UISwipeGestureRecognizer) {
        statusLabel.text = "DOWN SWIPE"
    }
    
}

