//
//  agregarContactoViewController.swift
//  ProyectoFinal01
//
//  Created by user189479 on 11/7/21.
//

import UIKit

class agregarContactoViewController: UIViewController {
    
    let PersonaSeguraControlador = personaSeguraControlador()
    
    @IBOutlet weak var nombreContacto: UITextField!
    @IBOutlet weak var descripcionContacto: UITextView!
    @IBAction func CancelarGrabacionContacto(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func insertarContacto(_ sender: UIButton) {
        
        var nuevaPersona = personaSegura(nombre: nombreContacto.text!, desc: descripcionContacto.text!)
        
        PersonaSeguraControlador.insertPersona(nuevaPersona: nuevaPersona){
            (resultado) in
            switch resultado{
            case .success(let exito):self.displayExito(exito: exito)
            case .failure(let error):self.displayError(e: error)
            }
        }
    }
    
    func displayError(e:Error){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: self.terminacion))
            self.present(alerta, animated: true, completion: nil)
        }
    }
    
    func displayExito(exito:String){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Actualización contacto", message: exito, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: self.terminacion))
            self.present(alerta, animated: true, completion: nil)
        }
    }
    
    func terminacion(alert: UIAlertAction!){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
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
