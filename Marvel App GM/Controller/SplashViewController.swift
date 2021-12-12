//
//  SplashViewController.swift
//  Marvel App GM
//
//  Created by Guido Mola on 01/12/2021.
//

import Foundation
import UIKit

class SplashViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigateNext()
        
    }
    
    private func navigateNext() {
        // Ejecutamos en el hilo principal de forma asíncrona después de 3 segundos
        // el código que está en el Closure.
        // Importante [weak self] para no retener dentro del Closure una referencia
        // a self 'SplashViewController'
        
        //Primera Opcion de espera en el splash ---> Timer
        //Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
        
        //Segunda Opcion de espera en el splash
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
        // Opción 1
            // Lanzamos la navegación del Segue 'SEGUE_TO_HOME'
            //            if let segueIdentifier = self?.SEGUE_TO_HOME {
            //                self?.performSegue(withIdentifier: segueIdentifier,
            //                                   sender: nil)
            //            }
            
            // Opción 2
            // Creamos navegación a mano al ViewController inicial del
            // storyboard del 'Home'.
            // Además hacemos un setViewControllers para borrar la pila
            // de navegación y añadir a la pila el ViewController 'destination'
            // como rootViewController
            let storyboardHome = UIStoryboard(name: "Main",
                                              bundle: nil)
            if let destination = storyboardHome.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination],
                                                               animated: true)
            }
        }
    }
 
    
}
