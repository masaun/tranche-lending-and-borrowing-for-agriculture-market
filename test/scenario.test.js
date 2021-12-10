const { expect } = require("chai");
const { ethers } = require("hardhat")
const { Signer, Wallet, BigNumber } = require('ethers')

//@dev - Deployed-contract addresses (on Mainnet)
const LENDING_POOL = '0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9'
const aDAI = '0x028171bCA77440897B824Ca71D1c56caC55b68A3'
const DAI = '0x6B175474E89094C44Da98b954EedeAC495271d0F'

//@dev - Constants
const A_HOUR = 60 * 60
const A_DAY = 24 * A_HOUR

//const BLOCKS_A_PERIOD = 4 * oracleCONF.windowSize / oracleCONF.granularity / 60
//const BLOCKS_A_HOUR = 4 * 60
//const BLOCKS_A_DAY = 24 * BLOCKS_A_HOUR


/**
 * @dev - Scenario test (Tranche lending ~ borrowing)
 */ 
describe("Scenario test (Tranche lending ~ borrowing)", function () {

    const user = Wallet

    //@dev - Contract instance
    let tranchePool   // TranchePool.sol
    let pool          // Yield Source Provider (e.g. AaveAsYieldSourceProvider.sol)
    let underlying    // Underlying Token      (e.g. DAI token)

    //@dev - Deployed-contract addresses
    let TRANCHE_POOL
    let POOL
    let UNDERLYING


    async function currentTimestamp() {
        const date = new Date()
        const a = date.getTime()
        const _currentTimestamp = Math.floor( a / 1000 )   // Unit: Seconds
        return _currentTimestamp                           // Unit: Seconds
    }

    async function currentBlock() {
        return await ethers.provider.getBlock('latest')
    }

    async function buyTokens(underlyingAmount_, minTokens_, deadline_) {
        //@dev - Approve underlying tokens
        const underlyingAmount = ethers.utils.parseEther(underlyingAmount_)
        await underlying.connect(user).approve(pool.address, underlyingAmount)

        //@dev - Buy tokens -> tx.wait()
        const minTokens = minTokens_                         // e.g). 1
        const deadline = deadline_
        //const deadline = await currentTimestamp() + A_HOUR   // Unit: Seconds
        console.log('=== deadline ===', deadline)

        let transaction = await tranchePool.connect(user).buyBond(underlyingAmount, minTokens, deadline)
        let txReceipt = await transaction.wait()
    }

    async function buyBond(principalAmount_, minGain_, deadline_, forDays_) {
        const principalAmount = principalAmount_
        const minGain = minGain_
        const deadline = deadline_
        const forDays = forDays_

        //@dev - Approve underlying tokens
        //const underlyingAmount = ethers.utils.parseEther(underlyingAmount_)
        //await underlying.connect(user).approve(pool.address, underlyingAmount)

        let transaction = await tranchePool.connect(user).buyBond(principalAmount, minGain, deadline, forDays)
        let txReceipt = await transaction.wait()
    }

    async function buyJuniorBond(tokenAmount_, maxMaturesAt_) {
        const tokenAmount = ethers.utils.parseEther(tokenAmount_)
        const maxMaturesAt = ethers.utils.parseEther(maxMaturesAt_)
        const TIME_IN_FUTURE = await currentTimestamp() + A_DAY
        await tranchePool.connect(user).buyJuniorBond(tokenAmount, maxMaturesAt, TIME_IN_FUTURE)
    }

    it("Check currentBlock", async function () {
        const _currentBlock = await currentBlock()
        console.log(`currentBlock: ${ JSON.stringify(_currentBlock) }`)
    })

    it("Check currentBlock", async function () {
        const _currentBlock = await currentBlock()
        //console.log(`currentBlock: ${ JSON.stringify(_currentBlock) }`)
    })

    it("Deploy or create smart contract instances", async function () {
        //@dev - Deploy the TranchePool.sol
        const name_ = "Junior Token"
        const symbol_ = "JUNIOR TOKEN"
        const decimals_ = 18
        const TranchePool = await ethers.getContractFactory('TranchePool')
        tranchePool = await TranchePool.deploy(name_, symbol_, decimals_, LENDING_POOL)

        //@dev - Deploy the AaveAsYieldSourceProvider.sol
        const aToken = aDAI
        const AaveAsYieldSourceProvider = await ethers.getContractFactory('AaveAsYieldSourceProvider')
        pool = await AaveAsYieldSourceProvider.deploy(aToken)

        //@dev - Create a underlying token instance (Using "DAI" as a underlying token)
        const underlying = await ethers.getContractAt('IERC20', DAI)

        //@dev - Assign deployed-addresses
        TRANCHE_POOL = tranchePool.address
        POOL = pool.address
        UNDERLYING = underlying.address
        console.log(`TRANCHE_POOL: ${ TRANCHE_POOL }`)
        console.log(`POOL: ${ POOL }`)
        console.log(`UNDERLYING: ${ UNDERLYING }`)
    })

    it("Whole scenario test (AAVE flow tests - yield and price movements)", async function () {
        const priceInitial = await tranchePool.callStatic.price();
        console.log(`priceInitial: ${ priceInitial }`)

        await buyTokens(Wallet[0], 100_000 * 10 ** 6);
        const gotJtokens1 = await tranchePool.callStatic.balanceOf(await Wallet[0].getAddress());
        console.log(`gotJtokens1: ${ gotJtokens1 }`)

        //await moveTimeWindowAndUpdate();

        //const providerRatePerDayInitial = await controller.callStatic.providerRatePerDay();

        const priceAfterJtokens = await tranchePool.callStatic.price();

        await buyBond(Wallet[0], 100_000 * 10 ** 6, 3);

        const bond1 = await tranchePool.seniorBonds(1);
        const abond1 = await tranchePool.abond();

        //await moveTimeWindowAndUpdate();

        await buyBond(Wallet[0], 100_000 * 10 ** 6, 1);
        const bond2 = await tranchePool.seniorBonds(2);

        //await moveTimeWindowAndUpdate();

        const priceAfter2Bonds = await tranchePool.callStatic.price();
        expect(priceAfter2Bonds.gt(priceAfterJtokens), 'price increases after 2 bonds').equal(true);

        await sellTokens(Wallet[0], 50_000 * 10 ** 6);

        await buyJuniorBond(Wallet[0], gotJtokens1.sub(50_000 * 10 ** 6), TIME_IN_FUTURE);

        for (let f = 0; f < 24 * 3; f++) {
          await moveTimeWindowAndUpdate();
        }

        const priceAfter3Days = await tranchePool.callStatic.price();

        await redeemBond(Wallet[0], 1);
        await redeemBond(Wallet[0], 2);

        await redeemJuniorBond(Wallet[0], 1);

        const priceAfterWithdrawls = await tranchePool.callStatic.price();

        const incentivesController = IStakedTokenIncentivesControllerFactory.connect(await aToken.getIncentivesController(), deployerSign);
        const rewardToken = IERC20Factory.connect(await incentivesController.REWARD_TOKEN(), deployerSign)
    })

})
