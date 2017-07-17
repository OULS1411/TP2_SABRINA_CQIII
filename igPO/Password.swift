//=================================
import UIKit
//=================================
class Password: UIViewController
{
    /* ---------------------------------------*/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setLabelAndButton()
    }
    /* ---------------------------------------*/
    override func didReceiveMemoryWarning(){
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
        
        if defaults.object(forKey: "PASSWORD") == nil { // verification de la boite si elle est vide
            defaults.set(textFieldInsertPW.text, forKey: "PASSWORD"); // enregistre le contenu du texteField en tant que mot de passe
            setLabelAndButton()
        } else {
            password = defaults.object(forKey: "PASSWORD") as! String // recupere le mot de passe existant
            
            if password == textFieldInsertPW.text{
                performSegue(withIdentifier: "seg", sender: nil)
            } else if textFieldInsertPW.text == "igpo" {
                defaults.removeObject(forKey: "PASSWORD") // suprimer l'ancien mot de passe
                 textFieldInsertPW.text = ""; // vider le champ
                setLabelAndButton() // cree un nouveau mot de passe
            } else {
                alert("MOT DE PASSE INVALIDE") // alerte mot de passe invalide
                textFieldInsertPW.text = ""; //vider le champs
            }
        }
    }
    //======================================================
    /*Fonction pour cree et inserer le mot de passe */
    private func setLabelAndButton() {
        if defaults.object(forKey: "PASSWORD") == nil {
            buttonCreateInsert.setTitle("VALIDER", for: .normal)
            Label.text = " NOUVEAU MOT DE PASSE"
        }
        else {
            buttonCreateInsert.setTitle("VALIDER", for: .normal);
            Label.text = "INSERER VOTRE MOT DE PASSE";
            textFieldInsertPW.text = "";
            textFieldInsertPW.isSecureTextEntry = true;
        }
    }
    //======================================================
    /*Fonction pour utiliser les alerte */
    func alert(_ theMessage: String) {
        let refreshAlert = UIAlertController(title: "Message...", message: theMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        refreshAlert.addAction(OKAction)
        present(refreshAlert, animated: true){}
    }
    //======================================================
}//end class
