//
//  ServerInfo.swift
//
//  Allows users to input the end of night values for calculation of tip share
//
//  Created by Eden Momchilov on 11/4/21.
//

import SwiftUI

// Model class to store the server array
class Model {
    var servers = [Server]()
}

// creates a Server object
struct Server: Hashable {
    let name: String
    let netSales: Float
    let houseOwesServer: Float
    let serverOwesHouse: Float
    let cashCollected: Float
    var serverTotal: Float
    
    // for preview purposes
    static var testServers = [Server(name: "Eden", netSales: 250, houseOwesServer: 3, serverOwesHouse: 4, cashCollected: 5, serverTotal: 5), Server(name: "Weston", netSales: 3, houseOwesServer: 4, serverOwesHouse: 5, cashCollected: 6, serverTotal: 7)]
}

// creates the ServerInfoView where users can input their end of night results
@available(iOS 15.0, *)
struct ServerInfoView: View {
    
    // number of servers & support staff
    let numberOfServers: Int
    let numberOfSupport: Int
    
    // creates a model object to store the server array
    var model = Model()
    
    // sets the display tips sheet to false
    @State var showDisplayTips: Bool = false
    
    // intitializes all server variables collected
    @State var name = ""
    @State var netSales = ""
    @State var houseOwesServer = ""
    @State var serverOwesHouse = ""
    @State var cashCollected = ""
    
    // creates the form view for user input
    var body: some View {
        NavigationView {
            VStack(spacing: 70) {
                Form {
                    Section {
                        HStack {
                            TextField("Name", text: $name)
                            ScanButton(text: $name, patternID: "Name")
                                .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Net Sales in the form of $X,XXX.XX")) {
                        HStack {
                            TextField("Net Sales", text: $netSales)
                                .keyboardType(.decimalPad)
                            ScanButton(text: $netSales, patternID: "Net Sales")
                                .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        HStack {
                            TextField("House owes server", text: $houseOwesServer)
                            .keyboardType(.decimalPad)
                        ScanButton(text: $houseOwesServer, patternID: "House Owes Server")
                            .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        HStack {
                            TextField("Server owes house", text: $serverOwesHouse)
                            .keyboardType(.decimalPad)
                        ScanButton(text: $serverOwesHouse, patternID: "Server Owes House")
                            .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    Section(footer: Text("Tips in the form of $XXX.XX")) {
                        TextField("Additional Cash Tips", text: $cashCollected)
                            .keyboardType(.decimalPad)
                    }
                    Button {
                        addServerInfo()
                    }
                label: {
                    Text("Save")
                }
                .disabled(formCheck())
                }
                .foregroundColor(Color("WCPBlue"))
                .navigationTitle("Server")
            }
        }
        .sheet(isPresented: $showDisplayTips, onDismiss: nil) {
            DisplayTips(serv: model.servers, numSup: numberOfSupport)
        }
    }
    
    // checks if the form is complete to enable and disable the save button
    func formCheck() -> Bool {
        // checks if the form is complete
        if (name.count < 1 || netSales.count < 1 || houseOwesServer.count < 1 || serverOwesHouse.count < 1 || cashCollected.count < 1) {
            return true
        }
        return false
    }
    
    // function to add server info & clear for the next
    func addServerInfo() {
        // creates a new server object with user inputs
        var server = Server(name: name, netSales: Float(netSales)!, houseOwesServer: Float(houseOwesServer)!, serverOwesHouse: Float(serverOwesHouse)!, cashCollected: Float(cashCollected)!, serverTotal: 0)
        
        // calculates the total amount of $$ the server brought in
        server.serverTotal = (server.houseOwesServer - server.serverOwesHouse) + server.cashCollected
        
        // adds the server object to the server array
        model.servers.append(server)
        
        // checks to see if this is the last server in the list.. if not, clears out input fields
        if (model.servers.count == numberOfServers) {
            showDisplayTips = true
        }
        else {
            name = ""
            netSales = ""
            houseOwesServer = ""
            serverOwesHouse = ""
            cashCollected = ""
            
        }
    }
    
    // creates the preview provider
    struct ServerInfoView_Previews: PreviewProvider {
        static var previews: some View {
            ServerInfoView(numberOfServers: 5, numberOfSupport: 2)
        }
    }
}

// formats the currency to $XX.XX
extension Float {
    func asCurrency() -> String {
        return String(format: "$%.02f", self)
    }
}
