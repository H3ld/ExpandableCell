import UIKit

@IBDesignable
class ExpandableBaseCellController: UITableViewController {

    // Background Image
    private var _backgroundImage = UIImage()
    @IBInspectable weak var backgroundImage: UIImage! {
        get { return _backgroundImage }
        set (newValue) {
            self._backgroundImage = newValue
        }
    }
    
    private var cellHeights: [CGFloat] = []
    
    private enum Const {
        static let closeCellHeight: CGFloat = 179
        static let openCellHeight: CGFloat = 579
        static let rowsCount = 10
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        // setting up data
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        
        // setting up cell
        tableView.estimatedRowHeight = Const.closeCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = UIColor(patternImage: _backgroundImage)
        
//        if #available(iOS 10.0, *) {
//            tableView.refreshControl = UIRefreshControl()
//            tableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
//        }
    }
    
//    @objc func refreshHandler() {
//        let deadlineTime = DispatchTime.now() + .seconds(1)
//        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
//            if #available(iOS 10.0, *) {
//                self?.tableView.refreshControl?.endRefreshing()
//            }
//            self?.tableView.reloadData()
//        })
//    }
}

extension ExpandableBaseCellController {
    
    /// musnt be overriden
    override func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    /// to be overriden
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 10
    }
    
    /// to be overriden
    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as ExpandableBaseCell = cell else { return }
        cell.backgroundColor = .clear
        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }
        cell.number = indexPath.row
    }
    
    /// to be overriden
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellView", for: indexPath) as! ExpandableBaseCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        
        return cell
    }
    
    /// to be overriden
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() { return }

        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
}
