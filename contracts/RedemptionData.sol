pragma solidity ^0.5.0;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract RedemptionData is Ownable {
    using SafeMath for uint256;
    mapping(address => uint256) private last_claimed;

    event SetClaim(address indexed Account, uint256 Time);
    event BonusClaimed(address indexed Account, uint256 Amount);

    constructor() public {
    }

    function awardUser(
        address _user, uint256 _amount
    ) public {
        emit BonusClaimed(_user, _amount);
    }

    function getLastClaimed(
        address _account
    ) public view onlyOwner returns(uint256) {
        return last_claimed[_account];
    }

    function setLastClaimed(
        address _account
    ) public onlyOwner returns(bool) {
        last_claimed[_account] = now;
        return true;
    }

}
