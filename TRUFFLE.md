## Truffle 무작정 따라하기

#### 트러플 설치

```
$ npm install -g truffle

# 프로젝트 만들기
$ mkdir myproject
$ cd myproject
$ truffle init 또는 $ truffle unbox metacoin
```



### Truffle Develop

Truffle Develop는 트러플 프레임워크에 내장된 개발용 블록체인입니다. 따라서 외부에 별도의 블록체인 환경을 준비할 필요가 없습니다.



#### Truffle develop

truffle Deveop 콘솔 표시
truffle(develop)>

```
$ truffle deveop

$ truffle compile
truffle(develop)>compile

```

### 스마트 컨트랙트 컴파일

##### 컴파일(compilelation)

Solidity는 컴파일 언어 입니다. 즉, Ethereum Virtual Machine(EVM)에서 실행하기 위해 bytecode로 컴파일 해야 합니다.

인간이 읽을수있는 Solidity코드를 EVM이 이해할수있는 무엇인가로 변환 번역 한다고 생각하면 됩니다.

```
$ truffle compile
$ truffle compile --all
```

컴파일 결과로 생성한 파일은 프로젝트의 build/contracts 티렉터리에 있습니다.

### 마이그레이션

```
$ truffle migrate
$ truffle migrate --reset
```

이더리움 네트워크에 계약을 배포하는 데 사요합니다. js로 만들며, 각 파일에 정의한 배포 작업을 담당합니다. 개발을 진행하면서 프로젝트에 새 계약을 추가된다고 가정합니다.

성공적으로 Smart Contract가 Compile되면 이제 블록체인으로 migrate 합니다.
마이그레인션(Migration)은 응용 프로그램의 계약 상태를 변경하여 한 상태에서 다음 상태로 이동시키는 전개 스크립트입니다. 첫 번째 마이그레이션의 경우 새 코드를 배포하는 것이지만 시간이 지남에 따라 다른 마이그레이션은 데이터를 이동하거나 계약을 새로운 것으로 대체 할 수 있습니다.



### 테스트

메타코인 test> metacoin.js 테스트가 우리가 한 명령이 잘 동작하는지 확인하는 과정, 잘못된 코드가 있는지 체크하는 과정


```
$ let Mycontract = await Metacoin.deployed
$ accounts
$ let balance = await MyContract.getBalance(accounts[0])
$ balance.toNumber()
$ let balance1 = await MyContract.getBalance(accounts[1])
$ balance1.toNumber()
$ MyContract.sendCoin(accounts[1],1000)

$ balance1.toNumber()
$ balance.toNumber()
$ let received = await MyContract.getBalance(accounts[1])
$ received.toNumber()
$ balance.toNumber()
$ let newbalance = await MyContract.getBalance(accounts[0])
$ newbalance.toNumber()

```
```
$ let testContract = await TestContract.deployed()
$ testContract.getValue()
$ testContract.setValue('hello')
$ testContract.getValue()
```

test>metacoin.js

(test>TestMetaCoin.sol 삭제 하면 된다.)

```
contract('MetaCoin', async(accounts) => {
  console.log(accounts);
  const metaCoinInstance = await MetaCoin.deployed();
  const balance = await metaCoinInstance.getBalance.call(accounts[0]);
  console.log('balance accounts[0] = ', balance);
  const metaCoinEthBalance = (await metaCoinInstance.getBalanceInEth.call(accounts[0])).toNumber();
  console.log('eth balance accounts[0] = ', metaCoinEthBalance);
  await metaCoinInstance.sendCoin(accounts[1], 1000, { from: accounts[0] });

```



