// CLT stands for Cong Linh Token
// Author linhnvc from CLT Smart Chain
const CLTToken = artifacts.require("CLTToken.sol");

module.exports = function (deployer) {
    deployer.deploy(CLTToken, 1000000);
};