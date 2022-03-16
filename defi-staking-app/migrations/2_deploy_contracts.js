const Tether = artifacts.require('Tether');
const RWD = artifacts.require('RWD');
const DecentralBank = artifacts.require('DecentralBank');

//Deploying the specific currencies --> occurs when the contract is deployed
module.exports = async function(deployer, network, accounts) {
    await deployer.deploy(Tether);
    const tether = await Tether.deployed()

    await deployer.deploy(RWD);
    const rwd = await RWD.deployed();

    await deployer.deploy(DecentralBank, rwd.address, tether.address);
    const decentralBank = await DecentralBank.deployed();


    //Transfer all RWD to the Decentral Bank
    await rwd.transfer(decentralBank.address, '1000000000000000000000000');

    //Give user 100 tether tokens when they come on the application
    await tether.transfer(accounts[1], '10000000000000000');

};