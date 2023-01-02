const simpleBank = artifacts.require("simpleBank");
 
module.exports = function (deployer) {
  deployer.deploy(simpleBank);
};
