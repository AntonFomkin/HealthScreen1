//
//  HealthVewController.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 09.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class HealthVewController: UIViewController {
    
    let dataModel: HealthData
    var myIndexPath: IndexPath?

     private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var productChoices =  ProductChoicesViewController()
  /* DietChoices */
    private(set) lazy var dietChoices: UIView = {
        let dietChoices = UIView()
        dietChoices.frame = .zero
        dietChoices.translatesAutoresizingMaskIntoConstraints = false
        dietChoices.layer.backgroundColor = UIColor.secondarySystemBackground.cgColor
        dietChoices.layer.cornerRadius = 10
        return dietChoices
    }()
    
    private(set) lazy var dietTitle: UILabel = {
        let dietTitle = UILabel()
        dietTitle.translatesAutoresizingMaskIntoConstraints = false
        dietTitle.text = "Диета"
        dietTitle.textColor = .lightGray
        dietTitle.font = UIFont.systemFont(ofSize: 14)
        dietTitle.numberOfLines = 0
        return dietTitle
    }()
    
    private(set) lazy var dietName: UILabel = {
        let dietName = UILabel()
        dietName.translatesAutoresizingMaskIntoConstraints = false
        dietName.textColor = .black
        dietName.font = UIFont.boldSystemFont(ofSize: 18)
        dietName.numberOfLines = 0
        return dietName
    }()
    
    private(set) lazy var dietSelector: UIButton = {
        let dietSelector = UIButton(type: .system)
        dietSelector.translatesAutoresizingMaskIntoConstraints = false
        dietSelector.setImage( UIImage(named: "arrowRight.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        dietSelector.layer.cornerRadius = 16.0
        dietSelector.addTarget(self, action: #selector(dietSelectorPressed), for: .touchUpInside)
        return dietSelector
    }()
    /* End DietChoises*/
    
    /* Recommendation*/

    private(set) lazy var recommendation: UIView = {
        let recommendation = UIView()
        recommendation.frame = .zero
        recommendation.translatesAutoresizingMaskIntoConstraints = false
        recommendation.layer.backgroundColor = UIColor.secondarySystemBackground.cgColor
        recommendation.layer.cornerRadius = 10
        return recommendation
    }()
    private(set) lazy var recomTitle: UILabel = {
        let recomTitle = UILabel()
        recomTitle.translatesAutoresizingMaskIntoConstraints = false
        recomTitle.text = "Рекомендуем увеличить потребление"
        recomTitle.textColor = .black
        recomTitle.font = UIFont.boldSystemFont(ofSize: 16)
        recomTitle.numberOfLines = 0
        return recomTitle
    }()
    private(set) lazy var recomDescr: UILabel = {
        let recomDescr = UILabel()
        recomDescr.translatesAutoresizingMaskIntoConstraints = false
        recomDescr.text = "Рекомендации основаны на истории Ваших покупок"
        recomDescr.textColor = .lightGray
        recomDescr.font = UIFont.systemFont(ofSize: 12)
        recomDescr.numberOfLines = 0
        return recomDescr
    }()
    /* End Recommendation*/
 
    /* ProductChoice*/
    private(set) lazy var productMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.scrollDirection = .horizontal

        let productMenu = UICollectionView(frame: .zero, collectionViewLayout: layout)
        productMenu.translatesAutoresizingMaskIntoConstraints = false
        productMenu.showsHorizontalScrollIndicator = false
        productMenu.dataSource = productChoices
        productMenu.delegate = productChoices
        productMenu.backgroundColor = self.view.backgroundColor
        return productMenu
    }()
    /* End ProductChoice*/


    /* MonthsMenu*/
    private(set) lazy var monthsMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 36.0
        layout.minimumLineSpacing = 0.0

        let monthsMenu = UICollectionView(frame: .zero, collectionViewLayout: layout)
        monthsMenu.translatesAutoresizingMaskIntoConstraints = false
        monthsMenu.showsHorizontalScrollIndicator = false
        monthsMenu.dataSource = self
        monthsMenu.delegate = self
        monthsMenu.backgroundColor = self.view.backgroundColor
        return monthsMenu
    }()
    /* End MonthsMenu*/
   
    
    private(set) lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.frame = .zero
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = "Потребление питательных веществ"
        infoLabel.textColor = .black
        infoLabel.font = UIFont.boldSystemFont(ofSize: 18)
        infoLabel.numberOfLines = 0
        return infoLabel
    }()
    
    
    private(set) lazy var infoBoardOne: InfoBoardView = {
        let infoBoardOne = InfoBoardView(targetComponents: "Белки", targetValue: 45, currentValue: 45)
        infoBoardOne.frame = .zero
        infoBoardOne.backgroundColor = UIColor.secondarySystemBackground
        infoBoardOne.translatesAutoresizingMaskIntoConstraints = false
        return infoBoardOne
    }()
  
    private(set) lazy var infoBoardTwo: InfoBoardView = {
        let infoBoardTwo = InfoBoardView(targetComponents: "Жиры", targetValue: 55, currentValue: 35)
        infoBoardTwo.frame = .zero
        infoBoardTwo.backgroundColor = UIColor.secondarySystemBackground
        infoBoardTwo.translatesAutoresizingMaskIntoConstraints = false
        return infoBoardTwo
    }()
    
    private(set) lazy var infoBoardThree: InfoBoardView = {
        let infoBoardThree = InfoBoardView(targetComponents: "Углеводы", targetValue: 55, currentValue: 75)
        infoBoardThree.frame = .zero
        infoBoardThree.backgroundColor = UIColor.secondarySystemBackground
        infoBoardThree.translatesAutoresizingMaskIntoConstraints = false
        return infoBoardThree
    }()
    
    // MARK: Выбор диеты
    @objc func dietSelectorPressed(_ sender: Any) {
        print("DietSelector Pressed")
    }
    
    required init?(coder: NSCoder) {
        self.dataModel = HealthData()
        super.init(coder: coder)
       
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        infoBoardOne.redraw.toggle()
        infoBoardTwo.redraw.toggle()
        infoBoardThree.redraw.toggle()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        monthsMenu.scrollToItem(at: myIndexPath!, at: .centeredHorizontally, animated: false)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dietName.text = dataModel.dietList[0]
        myIndexPath = IndexPath(row: dataModel.currentMonths! - 1, section: 0)
        monthsMenu.register(UINib(nibName: "MonthsCell", bundle: nil), forCellWithReuseIdentifier:  MonthsCell.reuseID)
        productMenu.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier:  ProductCell.reuseID)
        configureUIControls()
    }
}


extension HealthVewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthsCell", for: indexPath) as! MonthsCell
        configureCell(cell: cell, indexPath: indexPath)

        return cell
    }
    
    
    func configureCell(cell: MonthsCell, indexPath: IndexPath) {
        
        DispatchQueue.main.async { [weak self] in

            cell.updateSelector = {
                cell.monthName.textColor = cell.monthName.textColor.withAlphaComponent(1)
                cell.monthSelector.redraw = true
            }
            
            cell.monthName.text = self?.dataModel.months[indexPath.row]
           
            if indexPath == self?.myIndexPath {
                 cell.updateSelector!()
            } else {
                 cell.monthSelector.redraw = false
            }


        }
    }
}

extension HealthVewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let selectedCell = collectionView.cellForItem(at: indexPath)! as! MonthsCell

        collectionView.reloadData()
        selectedCell.updateSelector!()
        myIndexPath = indexPath
    }
}

extension HealthVewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthsCell", for: indexPath) as! MonthsCell
        
        return CGSize(width: configureWidthCell(cell: cell, indexPath: indexPath), height: collectionView.frame.height)
    }
    
    func configureWidthCell(cell: MonthsCell, indexPath: IndexPath) -> CGFloat {
       return getWidthText(text: self.dataModel.months[indexPath.row], font: cell.monthName.font)
    }
    
}




