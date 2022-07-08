//
//  ViewController.swift
//  planta-cool-ios
//
//  Created by Javier on 02/12/21.
//

import FirebaseDatabase
import UIKit
import SwiftUI

class ViewController: UIViewController {

    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Descargar firebase como diccionario
        
        database.child("P001").observe(.value, with: { snapshot in
            guard let humedadValor = snapshot.value as? [String: Any] else {
                return
            }
            
            // Porcentaje humedad descargado de firebase
            
            let label = UILabel(frame: CGRect(x: 20, y:210, width: self.view.frame.size.width-40, height:100))
        
            var numValor: AnyObject
            
            if humedadValor["humedad"] != nil {
                numValor = humedadValor["humedad"] as AnyObject
                label.text = "    \(numValor)%"
            }
            
            //label.textAlignment = NSTextAlignment.center
            label.font = UIFont(name: "Helvetica", size: 50)
            label.textColor = UIColor.white
            label.backgroundColor  = UIColor.black
            self.view.addSubview(label)
            

            
            print("Value: \(humedadValor)")
            
            
            // Label del estado del tanque descargando desde firebase
            
            let etiquetaA = UILabel(frame: CGRect(x:20, y:360, width: self.view.frame.size.width-40, height:55))
            
            var tanqueValor: AnyObject
            
            if humedadValor["tanque"] != nil {
                tanqueValor = humedadValor["tanque"] as AnyObject
                if "\(tanqueValor)" == "1" {
                    etiquetaA.text = "  Sí hay agua"
                } else {
                    etiquetaA.text = "  No hay agua"
                }
            }
            
            //etiquetaA.textAlignment = NSTextAlignment.center
            etiquetaA.font = UIFont(name: "Helvetica-Bold", size: 30)
            etiquetaA.backgroundColor  = UIColor.systemCyan
            etiquetaA.textColor = UIColor.white
            self.view.addSubview(etiquetaA)
            
            // mililitros usados
            
            let mililitros = UILabel(frame: CGRect(x:20, y:405, width: self.view.frame.size.width-40, height:50))
            
            var milValor: AnyObject
            
            if humedadValor["mililitros"] != nil {
                milValor = humedadValor["mililitros"] as AnyObject
                mililitros.text = "  Se han usado \(milValor)ml"
            }

            mililitros.layer.cornerRadius = 15
            mililitros.layer.borderWidth = 1
            mililitros.layer.borderColor = UIColor.systemCyan.cgColor
            mililitros.layer.backgroundColor = UIColor.systemCyan.cgColor
            //mililitros.textAlignment = NSTextAlignment.center
            mililitros.font = UIFont(name: "Helvetica-Bold", size: 20)
            mililitros.textColor = UIColor.white
            //mililitros.backgroundColor  = UIColor.white
            self.view.addSubview(mililitros)
            
        })
        
        let etiquetaTanque = UILabel(frame: CGRect(x:20, y:310, width:view.frame.size.width-40, height:75))
        
        //etiquetaTanque.layer.cornerRadius = 15
        etiquetaTanque.layer.borderWidth = 1
        etiquetaTanque.layer.borderColor = UIColor.systemCyan.cgColor
        etiquetaTanque.layer.backgroundColor = UIColor.systemCyan.cgColor
        //etiquetaTanque.textAlignment = NSTextAlignment.center
        etiquetaTanque.text = "  Estado del tanque"
        etiquetaTanque.font = UIFont(name: "Helvetica-Bold", size:20)
        etiquetaTanque.textColor = UIColor.black
        self.view.addSubview(etiquetaTanque)
        
        let etiquetaHumedad = UILabel(frame: CGRect(x:20, y:150, width:view.frame.size.width-40, height:100))
        
        //etiquetaHumedad.textAlignment = NSTextAlignment.center
        etiquetaHumedad.text = "   Humedad"
        //etiquetaHumedad.backgroundColor = UIColor.black
        etiquetaHumedad.font = UIFont(name: "Helvetica-Bold", size: 25)
        etiquetaHumedad.textColor = UIColor.gray
        etiquetaHumedad.layer.cornerRadius = 15
        etiquetaHumedad.layer.borderWidth = 1
        etiquetaHumedad.layer.borderColor = UIColor.black.cgColor
        etiquetaHumedad.layer.backgroundColor = UIColor.black.cgColor
        self.view.addSubview(etiquetaHumedad)
        
        let nombrePlanta = UILabel(frame: CGRect(x:20, y:60, width:view.frame.size.width-40, height:80))
        
        nombrePlanta.text = "Planta Cool 🌱"
        nombrePlanta.font = UIFont(name: "Helvetica-Bold", size: 40)
        self.view.addSubview(nombrePlanta)
        
        
        let button = UIButton(frame: CGRect(x: 20, y:500, width: view.frame.size.width-40, height:50))
        
        button.setTitle("Regar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size:20)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.link.cgColor
    }
    
    @objc private func addNewEntry() {
        let object: [String: Any] = [
            "regar": 1 as NSObject,
            "humedad": "detectando el ",
            "tanque": "detectando..."
        ]
        database.child("P001").setValue(object)
    }


}

