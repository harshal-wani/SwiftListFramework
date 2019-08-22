//
//  ListViewController.swift
//  SwiftListFramework
//
//  Created by Harshal Wani on 22/08/19.
//  Copyright © 2019 Harshal Wani. All rights reserved.
//

import UIKit

protocol ListHandler {
    func submit(option: String)
    func close()
}

public class ListViewController: UIViewController {
    
    var handler: ListHandler?
    
    public init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        
        self.view.backgroundColor = .lightGray

        let submitButton = UIButton(frame: CGRect(x: 50, y: 200, width: 100, height: 100))
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submit(_:)), for: .touchUpInside)
        self.view.addSubview(submitButton)
        
        
        let closeButton = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
        self.view.addSubview(closeButton)
        
    }
    @objc func dismiss(_ sender: UIButton) {
        print("dismiss")
        handler?.close()
        
    }
    @IBAction func submit(_ sender: UIButton) {
        print("submit")
        handler?.submit(option: "Done")
    }
}
