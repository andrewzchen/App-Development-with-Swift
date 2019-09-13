//
//  AddRegistrationTableViewController.swift
//  Hotel Manzana
//
//  Created by Andrew Chen on 7/19/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTVCDelegate {
    func didSelect(room: Room) {
        self.roomType = room
        updateRoomType()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        updateDateViews()
        updateNumGuests()
        updateRoomType()
    }
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    var roomType: Room?
    
    
    @IBOutlet var roomTypeLabel: UILabel!
    
    
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    @IBAction func wifiSwitchPressed(_ sender: UISwitch) {
    }
    @IBOutlet var checkInDateLabel: UILabel!
    
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    
    
    @IBOutlet var adultValueLabel: UILabel!
    @IBOutlet var adultStepper: UIStepper!
    
    @IBOutlet var childrenValueLabel: UILabel!
    @IBOutlet var childrenStepper: UIStepper!
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumGuests()
    }
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //    @IBAction func doneButtonPressed(_ sender: Any) {
//        let firstName = firstNameTextField.text ?? ""
//        let lastName = lastNameTextField.text ?? ""
//        let email = emailTextField.text ?? ""
//        let checkInDate = checkInDatePicker.date
//        let checkOutDate = checkOutDatePicker.date
//        let numAdults = Int(adultStepper.value)
//        let numChildren = Int(childrenStepper.value)
//        let hasWifi = wifiSwitch.isOn
//        let roomChoice = roomType?.name ?? "Not Set"
//
//        print ("Done button pressed")
//        print("First Name: \(firstName)")
//        print("Last Name: \(lastName)")
//        print("Email: \(email)")
//        print("Check In: \(checkInDate)")
//        print("Check Out: \(checkOutDate)")
//        print("Number of Adults: \(numAdults)")
//        print("Number of Children: \(numChildren)")
//        print("Wifi Access: \(hasWifi)")
//        print("Room Selection: \(roomChoice)")
//
//    }
    
    var registration: Registration? {
        guard let roomType = roomType else {return nil }
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numAdults = Int(adultStepper.value)
        let numChildren = Int(childrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastName, email: email, checkIn: checkInDate, checkOut: checkOutDate, numAdults: numAdults, numChildren: numChildren, roomChoice: roomType, wifiAccess: hasWifi)
        
    }
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        }
        else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func updateNumGuests() {
        adultValueLabel.text = "\(Int(adultStepper.value))"
        childrenValueLabel.text = "\(Int(childrenStepper.value))"
    }
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == checkInDatePickerCellIndexPath {
            if isCheckInDatePickerShown {
                return 216.0
            }
            else {
                return 0.0
            }
        }
        else if indexPath == checkOutDatePickerCellIndexPath {
            if isCheckOutDatePickerShown {
                return 216.0
            }
            else {
                return 0.0
            }
        }
            // for all non date picker cells use automatic height of 44
        else {
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDateLabelCellIndexPath {
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            }
            else if !isCheckInDatePickerShown && isCheckOutDatePickerShown {
                isCheckInDatePickerShown = true
                isCheckOutDatePickerShown = false
            }
            else {
                isCheckInDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        else if indexPath == checkOutDateLabelCellIndexPath {
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            }
            else if !isCheckOutDatePickerShown && isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            }
            else {
                isCheckOutDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        else {
            // do nothing
        }
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRoomType" {
            let destinationViewController = segue.destination as? SelectRoomTypeTVC
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
 

}
