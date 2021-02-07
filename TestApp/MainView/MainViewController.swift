//
//  MainViewController.swift
//  TestApp
//
//  Created by Neskin Ivan on 01.02.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var viewOutput: IMainViewOutput?
    var imageCollectionView: UICollectionView?
    
    fileprivate var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshItems), for: .valueChanged)
        return refreshControl
    }()
    
    fileprivate var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupConstraint()
        setupMainCollection()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageCollectionView?.frame = containerView.bounds.integral
    }
    
    private func setupMainCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollectionView?.register(MainCell.self, forCellWithReuseIdentifier: MainCell.cellID)
        imageCollectionView?.backgroundColor = .white
        imageCollectionView?.dataSource = self
        imageCollectionView?.delegate = self
        imageCollectionView?.semanticContentAttribute = .forceLeftToRight
        guard let imageCollectionView = imageCollectionView else { return }
        imageCollectionView.refreshControl = refreshControl
        containerView.addSubview(imageCollectionView)
        reloadData()
    }
    
    func setupConstraint() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Image"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewOutput?.viewDidLoad().count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView?.dequeueReusableCell(withReuseIdentifier: MainCell.cellID, for: indexPath) as! MainCell
        let items = viewOutput?.viewDidLoad()
        let item = items![indexPath.row]
        cell.photoImageView.loadImage(fromURL: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: containerView.bounds.size.width, height: containerView.bounds.size.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = imageCollectionView?.cellForItem(at: indexPath)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: ({
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 10, 0)
            cell?.layer.transform = rotationTransform
        }), completion: nil)
        viewOutput?.removeItem(indexPath: indexPath)
    }
}

extension MainViewController: IMainViewInput {
    func reloadData() {
        imageCollectionView?.reloadData()
    }
}

extension MainViewController {
    @objc func refreshItems(sender: UIRefreshControl) {
        viewOutput?.refreshItems()
        sender.endRefreshing()
    }
}

