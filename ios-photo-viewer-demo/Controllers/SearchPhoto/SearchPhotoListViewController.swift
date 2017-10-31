//
//  SearchPhotoListViewController.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import SVProgressHUD

final class SearchPhotoListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    fileprivate let searchPhotoAPI = SearchPhotoAPI()
    fileprivate let dataSource = SearchPhotoListProvider()
    fileprivate var searchPhotoStatus = SearchPhotoStatus.none
    fileprivate var tags = ""

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.dismiss()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Actions
    @IBAction private func searchDidTap() {
        resetPhotoList(status: .loading)
        loadSearchPhoto(tags: tagsTextField.text ?? "")
        tagsTextField.resignFirstResponder()
    }

    // MARK: - fileprivate
    fileprivate func resetPhotoList(status: SearchPhotoStatus) {
        searchPhotoAPI.reset()
        dataSource.add(status: status, photos: [])
        collectionView.reloadData()
    }

    fileprivate func manipulation() -> SVProgressHUD.ManipulationType {

        let manipulation: SVProgressHUD.ManipulationType

        if searchPhotoAPI.current() > 1 {
            manipulation = SVProgressHUD.ManipulationType.permit
        } else {
            manipulation = SVProgressHUD.ManipulationType.prohibited
        }
        return manipulation
    }

    // MARK: - Private
    private func setup() {
        addObserver()
        collectionView.dataSource = dataSource
        resetPhotoList(status: .none)
    }

    private func addObserver() {
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(textDidChange(notification:)),
                       name: .UITextFieldTextDidChange,
                       object: tagsTextField)
    }

    @objc private func textDidChange(notification: Notification) {
        toggleearchButtonIsEnabled()
    }

    private func toggleearchButtonIsEnabled() {
        guard let text = tagsTextField.text else { return }
        let isEnabled = text.characters.count > 0
        searchButton.isEnabled = isEnabled
        searchButton.backgroundColor = isEnabled ? #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) : #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }

    private func loadSearchPhoto(tags: String) {
        // ローディング（初回は操作許可）
        SVProgressHUD.kt.show(message: "MSG_LOADING".localized())
        self.tags = tags
        searchPhotoAPI.loadable = self
        searchPhotoAPI.load(tags: tags)
    }
}

// MARK: - SearchPhotoLoadable
extension SearchPhotoListViewController: SearchPhotoLoadable {

    func setStatus(status: SearchPhotoStatus) {

        searchPhotoStatus = status

        switch status {
        case .loaded(let result):
            updatePhotoList(result: result)
        default:
            resetPhotoList(status: status)
        }
        // ローディング消す
        SVProgressHUD.dismiss()
    }

    private func updatePhotoList(result: SearchPhotoResult?) {

        if let pages = result?.photos?.pages,
            let photos = result?.photos {

            searchPhotoAPI.updateTotal(total: pages)
            dataSource.append(status: searchPhotoStatus,
                              photos: photos.photo)
        }
        collectionView.reloadData()
        scrollToTop()
    }

    private func scrollToTop() {

        if searchPhotoAPI.current() == 1 {
            collectionView.scrollToTop()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension SearchPhotoListViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.isScrollEnd() {
            didScrollEnd()
        }
    }

    private func didScrollEnd() {

        switch searchPhotoStatus {
        case .loaded:
            if searchPhotoAPI.isMoreRequest() && !searchPhotoAPI.waiting() {
                nextloadPhotoList()
            }
        default:
            break
        }
    }

    private func nextloadPhotoList() {
        // ローディング（追加時は操作許可）
        SVProgressHUD
            .kt
            .show(manipulationType: SVProgressHUD.ManipulationType.permit,
                  message: "MSG_LOADING".localized())
        searchPhotoAPI.incement()
        searchPhotoAPI.load(tags: tags)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchPhotoListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return dataSource.view().cellSize(collectionView: collectionView)
    }
}

// MARK: - UITextFieldDelegate
extension SearchPhotoListViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
