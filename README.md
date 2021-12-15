# Tranche lending and borrowing smart contract for farmers👩‍🌾🌽  (※ NOTE: This repos is still in progress)
## 【Overview】
- There is a problem in agriculture sector in developing countries that it's difficult for small farmers to access financial product (such as borrowing money for their business). Even if they can access financial product, they often face that is forced to repay with high interest rate (such as traditional micro finance). 

- This is a smart contract that: 
  - allow farmers to borrow money with `lower interest rate` by eliminating middle man.
  - allow farmers to borrow money with `fixed-interest rate` by tranche scheme.
  - allow lenders (investors) to choose a option that lend money with `fixed-interest rate` by tranche scheme.

<br>

- Lenders (investors) can choose options either `junior tranche (bond)` or `senior tranche (bond)` .
  - If they choose a senior tranche (bond), their fund deposited are protected. 
  - If they choose a junior tranche (bond), their fund deposited are not protected. Instead, they can get higher interest rate.

<br>

## 【Workflow】
- Diagram of entire workflow
  ![diagram_tranche-lending-and-borrowing-smart-contract-for-farmers](https://user-images.githubusercontent.com/19357502/146112578-bd07745b-6a69-494b-a270-88c031e26cbb.jpeg)

<br>

## 【Technical Stack】
- Solidity (Solc): v0.7.6
- Hardhat: v2.6.1
- ethers.js: v5.5.1
- openzeppelin-solidity: v3.4.0
- Node.js: v16.7.0

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
- Tranche Scheme (Senior Tranche and Junior Tranche)
  - [Aricle]: How "Tranche" Lending will bring "fixed Interest rates" to DeFi 
    https://consensys.net/blog/codefi/how-tranche-lending-will-bring-fixed-interest-rates-to-defi/

<br>

- BUIDL IT
  - 🌽Agriculture related Project
    - Build a decentralised trade financing app with a focus on robust lending mechanism for agriculture👩‍🌾🌽  
      https://buidlit.devfolio.co/#prizes
