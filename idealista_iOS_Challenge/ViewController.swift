//
//  ViewController.swift
//  idealista_iOS_Challenge
//
//  Created by Manuel Cazalla Colmenero on 31/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let networkManager = BaseNetwork()
        
        networkManager.fetchAdList { result in
            switch result {
            case .success(let ads):
                print("Anuncios recibidos: \(ads)")
                DispatchQueue.main.async {
                    //actualizar vista
                   
                }
            case .failure(let error):
                print("Error al obtener los anuncios: \(error)")
            }
        }
    }
}
