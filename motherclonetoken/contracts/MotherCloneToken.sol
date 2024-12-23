// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20PresetMinterPauser.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts/proxy/Proxy.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// The contract is ERC20 based and upgradeable for further cloning
contract MotherCloneToken is ERC20PresetMinterPauser, Ownable {
    
    uint256 public rewardPerBlock = 1000 * 10 ** 18; // Define the reward per block (1000 MCT tokens)
    mapping(address => uint256) public validatorRewards; // Track rewards of validators
    mapping(address => bool) public validators; // Track registered validators
    uint256 public lastBlockRewarded; // Keep track of the last block that was rewarded

    // Event to notify that a validator has been rewarded
    event ValidatorRewarded(address validator, uint256 rewardAmount, uint256 blockNumber);

    // Constructor for the token
    constructor() ERC20PresetMinterPauser("MotherCloneToken", "MCT") {
        lastBlockRewarded = block.number;
    }

    // Modifier to ensure only registered validators can receive rewards
    modifier onlyValidator() {
        require(validators[msg.sender], "Not a registered validator");
        _;
    }

    // Register a validator (can only be called by the contract owner)
    function registerValidator(address _validator) external onlyOwner {
        validators[_validator] = true;
    }

    // Remove a validator (can only be called by the contract owner)
    function removeValidator(address _validator) external onlyOwner {
        validators[_validator] = false;
    }

    // Reward validators based on block generation
    function rewardValidator() external onlyValidator {
        require(block.number > lastBlockRewarded, "Reward can only be claimed once per block");

        // Calculate the reward based on the blocks generated by the validator
        uint256 rewardAmount = rewardPerBlock;

        // Mint the MCT tokens and transfer them to the validator
        _mint(msg.sender, rewardAmount);

        // Emit an event for transparency
        emit ValidatorRewarded(msg.sender, rewardAmount, block.number);

        // Update the last block rewarded
        lastBlockRewarded = block.number;
    }

    // Function to change the reward per block (only owner can update)
    function setRewardPerBlock(uint256 _rewardAmount) external onlyOwner {
        rewardPerBlock = _rewardAmount;
    }

    // View function to check the current reward rate
    function getRewardPerBlock() external view returns (uint256) {
        return rewardPerBlock;
    }

    // For proxy contracts: enabling easy proxy upgradeability
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    // This is for easier cloning via Proxy pattern
    function getImplementation() external view returns (address) {
        return address(this);
    }
}

