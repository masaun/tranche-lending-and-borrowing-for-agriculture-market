# Tranche Lending and Borrowing platform for farmers👩‍🌾🌽  (※ NOTE: This repos is still in progress)
## 【Overview】
- There is a problem in agriculture sector in developing countries that it's difficult for small farmers to access financial product (such as borrowing money for their business). Even if they can access financial product, they often face that is forced to repay with high interest rate. 

- This is a smart contract that: 
  - allow farmers to borrow money with `lower interest rate` by eliminating middle man.
  - allow farmers to borrow money with `fixed-interest rate` by tranche scheme.
  - allow lenders (investors) to choose a option that lend money with `fixed-interest rate` by tranche scheme.

<br>

- Lenders (investors) can choose options either `junior tranche (bond)` or `senior tranche (bond)` .
  - If they choose a senior tranche (bond), their fund deposited are protected. 
  - If they choose a junior tranche (bond), their fund deposited are not protected. Instead, they can get higher interest rate.

<br>

## 【Technical Stack】
- Solidity (Solc): v0.7.6
- Hardhat: v2.6.1
- ethers.js: v5.5.1
- openzeppelin-solidity: v3.4.0


<br>

## 【Installation】
- ① Install NPM modules
```
npm install
```

<br>


<br>

## 【Test】
- Senario test
```
npm run test:Scenario
```
( `$ npx hardhat test ./test/scenario.test.js --network hardhat` )

<br>

## 【References】
- BUIDL IT
  - 🌽Agriculture related Project - Agri 10x 
    - Build a decentralised trade financing app with a focus on robust lending mechanism for agriculture👩‍🌾🌽  
      https://buidlit.devfolio.co/#prizes

<br>

- Tranche Scheme (Senior Tranche and Junior Tranche)
  - BarnBridge📈: 
    - Doc: https://docs.barnbridge.com/smart-yield/beginners-guide-to-smart-yield
    - SC - BarnBridge-SmartYieldBonds/contracts：https://github.com/BarnBridge/BarnBridge-SmartYieldBonds/blob/master/contracts/ISmartYield.sol

  - Saffron.finance📈: 
    - Doc: https://app.saffron.finance/#home 
    - SC: https://github.com/saffron-finance/saffron

<br>

<br>

<hr>

# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```
