pragma solidity ^0.8.9;

contract RPS {
    enum Hand {
        Rock,
        Paper,
        Scissors
    }
    struct Player {
        address addr;
        Hand hand;
        uint256 deposit;
    }

    Player starter;
    Player joiner;
    bool public gameStarted;
    uint256 public balance;

    function safeTransferETH(address to, uint256 value) internal {
        (bool success, ) = to.call{value: value}(new bytes(0));
        require(
            success,
            "TransferHelper::safeTransferETH: ETH transfer failed"
        );
    }

    function startGame(Hand _hand) public payable {
        require(!gameStarted);
        starter = Player(msg.sender, _hand, msg.value);
        gameStarted = true;
    }

    function joinGame(Hand _hand) public payable {
        require(balance == msg.value);
        require(gameStarted);
        joiner = Player(msg.sender, _hand, msg.value);
        checkResult();
    }

    function checkResult() internal {
        if (starter.hand == joiner.hand) {
            safeTransferETH(starter.addr, starter.deposit);
            safeTransferETH(joiner.addr, joiner.deposit);
        } else {
            if (
                (starter.hand == Hand.Rock && joiner.hand == Hand.Scissors) ||
                (starter.hand == Hand.Scissors && joiner.hand == Hand.Paper) ||
                (starter.hand == Hand.Paper && joiner.hand == Hand.Rock)
            ) {
                safeTransferETH(starter.addr, starter.deposit * 2);
            } else {
                safeTransferETH(joiner.addr, joiner.deposit * 2);
            }
        }
    }
}
