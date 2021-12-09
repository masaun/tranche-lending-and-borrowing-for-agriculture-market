const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Scenario test (Tranche lending ~ borrowing)", function () {

    async function currentBlock() {
        return await ethers.provider.getBlock('latest')
    }

    it("Check currentBlock", async function () {
        // [TODO]:
        const _currentBlock = await currentBlock()
        console.log(`currentBlock: ${ JSON.stringify(_currentBlock) }`)
    })



})
