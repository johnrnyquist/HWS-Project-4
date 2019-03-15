import UIKit

class TableViewController: UITableViewController {

    var websites = ["apple.com", "hackingwithswift.com", "nyquist.net"]

    
    //MARK: - UIViewController class
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    //MARK: - UITableViewDataSource protocol

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = websites[indexPath.row]

        return cell
    }
    
    
    //MARK: - UITableViewDelegate protocol
    
    // Tells the delegate that the specified row is now selected.
    // This class is the delegate.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailView = storyboard?.instantiateViewController(withIdentifier: "Detail") as? ViewController {
            detailView.websites = websites
            detailView.selectedWebsite = websites[indexPath.row]
            detailView.title = "\(websites[indexPath.row])"
            // Pushes a view controller onto the receiver’s stack and updates the display. Note it is animated.
            navigationController?.pushViewController(detailView, animated: true)
        }
    }

}
