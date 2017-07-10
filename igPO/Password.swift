//=================================
import UIKit
//=================================
class Password: UIViewController
{
    /* ---------------------------------------*/
    override func viewDidLoad()
    {
        super.viewDidLoad()
       // super.password = "******\(substr)"
    }
    /* ---------------------------------------*/
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    //======================================================
    public var defaults = UserDefaults.standard
    var password : String!
    //======================================================
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var textFieldInsertPW: UITextField!
    @IBOutlet weak var buttonCreateInsert: UIButton!
    
   
    //======================================================
    @IBAction func boutonVerification(_ sender: UIButton) {
        if defaults.object(forKey: "PASSWORD") == nil {
            defaults.set(textFieldInsertPW.text, forKey: "PASSWORD");
          setLabelAndButton()
 
    }
        
    }
        
        //======================================================
        private func setLabelAndButton() {
            if defaults.object(forKey: "PASSWORD") == nil {
                buttonCreateInsert.setTitle("CREATE", for: .normal)
                Label.text = "CREATE PASSWORD"
            }
            else {
                buttonCreateInsert.setTitle("INSERT", for: .normal);
                Label.text = "INSERT PASSWORD";
                textFieldInsertPW.text = "";
                textFieldInsertPW.isSecureTextEntry = true;
            }
        }
        //======================================================
}//end class
