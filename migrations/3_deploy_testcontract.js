const TestContract = artifacts.require("TestContract");

module.exports = function(deployer) {
  deployer.deploy(TestContract); // 블록체인의 배포가 됨
};
