//
//  agregarDireccion.swift
//  ProyectoFinal01
//
//  Created by Juan Carlos OMB on 04/11/21.
// nuevaUbicacion

import UIKit

class agregarDireccion: UIViewController {

    let LugarSeguroControlador = lugarSeguroControlador()
    
    @IBOutlet weak var ubicacion: UITextField!
    
    
    @IBAction func cancelarGrabacionUbicacion(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func aceptarGrabacionUbicacion(_ sender: Any) {
        var nuevaUbicacion = lugarSeguro(direccion: ubicacion.text!, desc: "")
        
        LugarSeguroControlador.insertUbicacion(nuevaUbicacion: nuevaUbicacion){
            (resultado) in
            switch resultado{
            case .success(let exito):self.displayExito(exito: exito)
            case .failure(let error):self.displayError(e: error)
            }
            
        }
        
    }
    
    func displayError(e:Error){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Error de creación en BD", message: e.localizedDescription, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: self.terminacion))
            self.present(alerta, animated: true, completion: nil)

        }
    }
    
    func displayExito(exito:String ){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Direccion creada en BD", message: exito, preferredStyle: .alert)
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
