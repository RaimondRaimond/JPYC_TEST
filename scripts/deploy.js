async function main() {

    const RPS = await ethers.getContractFactory("RPS");
    const rps = await RPS.deploy();

    await rps.deployed();

    console.log(` RPS deployed to ${rps.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});