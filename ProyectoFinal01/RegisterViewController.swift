//
//  RegisterViewController.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 05/11/21.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var correo: UITextField!
    
    @IBOutlet weak var contra: UITextField!
    
    @IBOutlet weak var telefono: UITextField!
    
    @IBAction func crearCuenta(_ sender: Any) {
        if let email = correo.text, let password = contra.text{
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                if let result = result, error == nil{
                    //exito
                    self.navigationController?.pushViewController(LogInViewController(), animated: true)
                }else{
                    //error
                    let alertController = UIAlertController(title: "Error", message: "Error al crear al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
