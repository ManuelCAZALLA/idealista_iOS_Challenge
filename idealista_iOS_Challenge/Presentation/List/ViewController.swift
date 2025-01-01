//
//  ViewController.swift
//  idealista_iOS_Challenge
//
//  Created by Manuel Cazalla Colmenero on 31/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var ads: [ListModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        let networkManager = BaseNetwork()
        networkManager.fetchAdList { result in
            switch result {
            case .success(let ads):
                print("Anuncios recibidos: \(ads)")
                DispatchQueue.main.async {
                    self.ads = ads
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error al obtener los anuncios: \(error)")
            }
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        let ad = ads[indexPath.row]
        cell.textLabel?.text = ad.address 
        return cell
    }
}
