//
//  deatllePersonaSeguraViewController.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 04/10/21.
//

import UIKit

class detallePersonaSeguraViewController: UIViewController {
    var personaSeg: personaSegura?
    var controladorPersonas = personaSeguraControlador()
    
    @IBOutlet weak var savePersona: UIButton!
    
    @IBOutlet weak var editarPersonaB: UIBarButtonItem!
    @IBOutlet weak var personaEtiqueta: UILabel!
    @IBOutlet weak var cancelPersona: UIButton!
    @IBOutlet weak var descripcionVistaTexto: UITextView!
    var editando = false
    
    func botones(editando:Bool){
        if editando{
            savePersona.isHidden = false
            cancelPersona.isHidden = false
            editarPersonaB.isEnabled = false
            descripcionVistaTexto.isEditable = true
            
        }
        else {
            savePersona.isHidden = true
            cancelPersona.isHidden = true
            editarPersonaB.isEnabled = true
            descripcionVistaTexto.isEditable = false
            
        }
    }
    
    @IBAction func editarPersona(_ sender: UIBarButtonItem) {
        editando = !editando
        botones(editando: editando)
    }
    
    @IBAction func guardarPersona(_ sender: UIButton) {
        editando = !editando
        botones(editando: editando)
        let personaActualizada = personaSegura(id: personaSeg!.id, nombre: personaSeg!.nombre, desc: descripcionVistaTexto.text!)
        //Llamar BD con la actualizacion
        controladorPersonas.updatePersona(personaActualizada: personaActualizada){
            (resultado) in
            switch resultado{
            case .failure(let error):self.displayError(e: error)
            case .success(let exito):self.displayExito(exito: exito)
            }
        }
        
    }
    
    func displayError(e:Error){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Error de actualización", message: e.localizedDescription, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alerta, animated: true, completion: nil)
        }
    }
    
    func displayExito(exito:String){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Actualización detalle contacto", message: exito, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alerta, animated: true, completion: nil)
        }
    }

    @IBAction func cancelarEdicionPersona(_ sender: UIButton) {
        editando = !editando
        botones(editando: editando)
        descripcionVistaTexto.text = personaSeg?.descripcion
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personaEtiqueta.text = personaSeg?.nombre
        descripcionVistaTexto.text = personaSeg?.descripcion
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
