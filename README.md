# JPYC＿TEST

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

前提条件として、Node.jsをインストールしてください。
次にyarn installを実行。


このリポジトリではgoerliしか設定されていないので、他のnetworkを使用したい場合、hardhat.config.jsにてnetworkを追加してください。

**hardhatにデプロイする場合**
npx hardhat nodeを実行し、ノードを立てる。
npx hardhat run scripts/deploy.jsを実行し、デプロイ。

**goerliにデプロイする場合**
npx hardhat run scripts/deploy.js --network goerliを実行し、デプロイ。

startgame関数でゲーム主催者はジャンケンを開始することができます。この時賭け金の設定もします。
joingame関数にてゲームが既に開催されていた場合、ゲームに参加することが可能です。この時、主催者が設定した額と同じ額の賭け金を賭けるする必要があります。これと同時にジャンケンが実行されます。

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
