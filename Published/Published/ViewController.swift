//
//  ViewController.swift
//  Published
//
//  Created by Nikunj Modi on 05/02/25.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    private var viewModel = MyViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.viewModel.text = "MdNiks"
        }
    }
    
    private func bindViewModel() {
        viewModel.$text
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink { [weak self] newText in
                self?.name.text = newText
            }
            .store(in: &cancellables)
    }
}
