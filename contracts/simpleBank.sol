// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
 
contract simpleBank {
    function addFunds() external payable{
        funders.push(msg.sender); 
        amountSend.push(msg.value);
    }

    address[] public funders;
    uint[] public amountSend; 
    
}




// const instance = await simpleBank.deployed()
//instance.addFunds({value: "2000000000000000000", from: accounts[0]})
//instance.addFunds({value: "500000000000000000", from: accounts[1]})
//const funds = instance.funds()
