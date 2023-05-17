//
//  JuegosViewController.swift
//  MolinaColeccionDeJuegos
//
//  Created by Junior on 5/17/23.
//  Copyright © 2023 empresa. All rights reserved.
//

import UIKit

class JuegosViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tituloTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagenSeleccionada = info[.originalImage] as? UIImage
        imageView.image = imagenSeleccionada
        imagePicker.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true,
                completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
    }
    @IBAction func agregarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as!
           AppDelegate).persistentContainer.viewContext
        let juego = Juego(context: context)
        juego.titulo = tituloTextField.text
        juego.imagen = imageView.image?.jpegData(compressionQuality: 0.50)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }

}
