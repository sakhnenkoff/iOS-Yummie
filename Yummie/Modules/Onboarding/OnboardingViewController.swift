//
//  Onboarding module - OnboardingViewController.swift
//  Yummie
//
//  Created by sakhnenkoff on 15/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    public var viewModel: OnboardingViewModel!
    
    @IBOutlet
    weak var collectionView: UICollectionView!
    
    @IBOutlet
    weak var nextButton: UIButton!
    
    @IBOutlet
    weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == viewModel.slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupBindings()
        
        viewModel.viewDidLoad()
    }
    
    //MARK: - Configuration
    
    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupBindings() {

    }
    
    //MARK: - Actions
    
    @IBAction func didTapNextButton(_ sender: UIButton) {
        guard currentPage != viewModel.slides.count - 1 else { return }
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OnboardingCollectionViewCell.self), for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(with: viewModel.slides[indexPath.item])
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width, height: collectionView.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
