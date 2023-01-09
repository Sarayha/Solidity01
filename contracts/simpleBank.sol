// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
 
contract simpleBank {
   // address[] public funders;
    //uint[] public amountSend;
    uint public numberOfFunders; // מתחיל עם ערך 0 אי ן צורך לבצע השמה מיוחדת 
    // unmberOfFunder - משתנה STATE של החוזה
    mapping(address => bool) private funders;  
    mapping(uint => address) private lutFunders;
    mapping(address => uint) private fundersValue;
    address public owner;

    constructor(){
        owner = msg.sender;
    }
    
    modifier onlyOwner (){
        require(msg.sender == owner, "Only the owner can do that");
        _;
    }
// מי שלא הOWNER לא יכול להפעיל את הפונקציה הזו 
    function transferOwnerShip(address newOwner) external onlyOwner{
        owner = newOwner;
    }




    function addFunds() external payable{
       // funders.push(msg.sender); 
        //amountSend.push(msg.value);
       address funder = msg.sender;
       if(!funders[funder]){
        uint index = numberOfFunders++;
        funders[funder] = true;
        lutFunders[index] = funder;


       }
    }

    function getAllFunders() external view returns(address[] memory){
        address[] memory _funders = new address[] (numberOfFunders);
        for(uint i=0; i < numberOfFunders ; i++){
            _funders[i] = lutFunders[i];
        }
        return _funders;

    }


    function withdraw ( uint withdrawAmount) external{
        require(withdrawAmount < 1000000000000000000 || msg.sender == owner, "you can't withdraw more than 1 ether");
        payable (msg.sender).transfer(withdrawAmount);
    }

    function valueOfFunders() external view returns(uint[] memory){
        uint[] memory _value = new uint[](numberOfFunders);
            for(uint i=0;i<numberOfFunders;i++){
                     _value[i] = fundersValue[i]; 
  }
  return _value;
}


    

}




// const instance = await simpleBank.deployed()
//instance.addFunds({value: "500000000000000000", from: accounts[0]})
//instance.addFunds({value: "500000000000000000", from: accounts[1]})
//const funds = instance.funds()
//instance.getAllFunders()
// instance.withdraw(1000000000000000000)
