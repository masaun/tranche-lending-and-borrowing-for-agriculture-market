const { expect } = require("chai");
const { ethers } = require("hardhat")
const { Signer, Wallet, BigNumber } = require('ethers')

//@dev - Deployed-contract addresses (on Mainnet)
const LENDING_POOL = '0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9'
const aDAI = '0x028171bCA77440897B824Ca71D1c56caC55b68A3'
const DAI = '0x6B175474E89094C44Da98b954EedeAC495271d0F'


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


    async function currentBlock() {
        return await ethers.provider.getBlock('latest')
    }

    async function buyTokens(amountUnderlying) {
        //@dev - Approve underlying tokens
        const amountUnderlying_ = ethers.utils.parseEther(amountUnderlying)
        await underlying.connect(user).approve(pool.address, amountUnderlying)

        //@dev - Buy tokens -> tx.wait()
        const underlyingAmount = amountUnderlying_
        const minTokens = 1

        const date = new Date()
        const a = date.getTime()
        const deadline = Math.floor( a / 1000 )   // Unit: Seconds
        console.log('=== deadline ===', deadline)

        await (await tranchePool.connect(user).buyBond(underlyingAmount, minTokens, deadline)).wait()
    }

    async function buyBond() {
        // [TODO]: 
    }


    it("Check currentBlock", async function () {
        const _currentBlock = await currentBlock()
        console.log(`currentBlock: ${ JSON.stringify(_currentBlock) }`)
    })

    it("Check currentBlock", async function () {
        const _currentBlock = await currentBlock()
        console.log(`currentBlock: ${ JSON.stringify(_currentBlock) }`)
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


})
