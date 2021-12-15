# Tranche lending and borrowing smart contract for agriculture market👩‍🌾🌽  (※ NOTE: This repos is still in progress)
## 【Overview】
- There is a problem in agriculture sector (especially, in developing countries) that it's difficult for small farmers to access financial product (such as borrowing money for their business). Even if they can access financial product, they often need to repay extremely high interest rates. (include the case of traditional micro finance). 

- This is a smart contract that: 
  - allow `farmers` (borrowers) to borrow money with `lower interest rate` by eliminating middle man.
  - allow `farmers` (borrowers) to borrow money with `fixed-interest rate` by tranche scheme.
  - allow `investors` (lenders) to choose a option that lend money with `fixed-interest rate` by tranche scheme.

<br>

- Lenders (investors) can choose options either `junior bonds` or `senior bonds` .
  - If they buy senior bonds, they can receive interests based on the fixed-rate. In addition to that, their principle funds deposited are protected. 
  - If they buy junior bonds, their principle funds deposited are not protected. Instead, they can get higher interest rate. (※ That interest rate is the variable-rate)

<br>

## 【Workflow】
- [Diagram of entire workflow]
  ![diagram_tranche-lending-and-borrowing-smart-contract-for-farmers](https://user-images.githubusercontent.com/19357502/146214707-7c929853-81d1-41a6-8548-bdb931918b51.jpeg)

<br>

- [How to keep `fixed-rate` for lenders who bought `senior bonds` if interest rate of AAVE goes down]: 
  - If the interest rate of AAVE-v2 is more going down than the fixed-rate that was set, the TranchePool contract maintain the fixed-rate by applying funds pooled that are accumulated by which JuniorTokens are bought.

<br>

- [NOTE]: 
  - Repaid amount is calculated based on BorrowTokens that a farmer has.

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

## 【Test】(※ In progress)
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
  - Agriculture related Project
    - Build a decentralised trade financing app with a focus on robust lending mechanism for agriculture.  
      https://buidlit.devfolio.co/#prizes
