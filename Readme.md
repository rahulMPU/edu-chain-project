# Decentralized Note App

The **Decentralized Note App** is a simple decentralized application (DApp) built on Ethereum that allows users to securely store and retrieve personal notes using smart contracts. The app leverages blockchain technology to ensure transparency, immutability, and data integrity for each note stored. Users can store notes with timestamps and retrieve them using the note ID.

## Features

- **Store Notes**: Users can create and store notes on the Ethereum blockchain.
- **Retrieve Notes**: Users can retrieve their notes by providing a note ID.
- **Blockchain Transparency**: All notes are stored on the blockchain, ensuring they cannot be modified or deleted.
- **Timestamped Notes**: Each note is timestamped, allowing users to track when the note was created.

## How It Works

### Smart Contract Functions:

- **storeNote**: Allows users to store a note on the blockchain. Each note has a `content` (string) and a `timestamp` (uint256).
- **getNote**: Allows users to retrieve a note by its ID. The note is returned with its `content` and the `timestamp` when it was created.

### Frontend (Web3.js):

The frontend uses **Web3.js** to interact with the Ethereum blockchain. It allows users to:

- Create new notes and store them on the blockchain.
- Retrieve stored notes by their ID.
- View note content and timestamp.

---

## Prerequisites

To use the **Decentralized Note App**, you need the following:

- **MetaMask**: Install the MetaMask extension to interact with Ethereum networks.
- **Ethereum Network**: You can use a test network like **Rinkeby** or **Goerli** for testing. The application is connected to an Ethereum node through MetaMask.
- **Web3.js**: The JavaScript library used to interact with Ethereum smart contracts. This is included in the project.

---

## Installation & Usage

### Step 1: Install MetaMask

1. Install the MetaMask extension in your browser (Chrome, Firefox, Brave).
2. Set up an Ethereum account on MetaMask and connect to a network (Rinkeby, Goerli, etc.).
3. Make sure your MetaMask account has some test Ether (for Rinkeby or Goerli).

### Step 2: Deploy the Smart Contract

1. **Deploy the Smart Contract**:
   - Deploy the **Decentralized Note App** contract on the Ethereum network using tools like **Remix** or **Truffle**.
   - After deployment, obtain the **contract address** and **ABI**.

### Step 3: Set Contract Address and ABI in the Frontend

1. Open the `index.html` file in a code editor.
2. Replace the placeholders with your contract details:
   - Replace `'YOUR_CONTRACT_ADDRESS'` with the address of your deployed smart contract.
   - Replace `/* ABI GOES HERE */` with the actual ABI of your smart contract.

### Step 4: Open the Application

1. Open the `index.html` file in a web browser with MetaMask installed.
2. Connect MetaMask to your Ethereum account.
3. Interact with the DApp:
   - **Store a Note**: Enter content and click **Store Note**.
   - **Retrieve a Note**: Enter the note ID and click **Retrieve Note**.

---

## Example Interaction

1. **Store a Note**:

   - Input content such as "Remember to buy groceries" in the text area.
   - Click the **Store Note** button. This will send a transaction to the Ethereum blockchain, storing the note content with a timestamp.

2. **Retrieve a Note**:
   - After storing a note, you can retrieve it by providing the **Note ID** (which is auto-generated by the contract).
   - Click the **Retrieve Note** button to view the content of the note along with the timestamp.

---

## Contract Code

The contract is written in **Solidity** and implements the following functionalities:

- **storeNote**: Stores a note with its content and timestamp.
- **getNote**: Retrieves a stored note based on the user's address and the note ID.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedNoteApp {

    struct Note {
        string content;  // The content of the note
        uint256 timestamp; // The timestamp when the note was created
    }

    mapping(address => mapping(uint256 => Note)) public userNotes;

    event NoteStored(address indexed user, uint256 noteId, string content, uint256 timestamp);

    uint256 public noteIdCounter;

    function storeNote(string calldata content) external {
        require(bytes(content).length > 0, "Note content cannot be empty");

        noteIdCounter++;
        userNotes[msg.sender][noteIdCounter] = Note({
            content: content,
            timestamp: block.timestamp
        });

        emit NoteStored(msg.sender, noteIdCounter, content, block.timestamp);
    }

    function getNote(address user, uint256 noteId) external view returns (string memory content, uint256 timestamp) {
        Note storage note = userNotes[user][noteId];
        require(bytes(note.content).length > 0, "Note does not exist");

        return (note.content, note.timestamp);
    }
}
```

---

## Tech Stack

- **Solidity**: Smart contract language for building the decentralized application.
- **Web3.js**: JavaScript library used for interacting with the Ethereum blockchain.
- **MetaMask**: Ethereum wallet extension for browser, used to manage accounts and sign transactions.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Contributing

Feel free to fork the repository and submit pull requests. If you have any suggestions or improvements, please open an issue.

---

## Contact

For any questions, feedback, or suggestions, please feel free to reach out via GitHub issues or email.

---

### Acknowledgments

- Ethereum: For providing a decentralized platform.
- Web3.js: For enabling JavaScript to interact with the Ethereum blockchain.
- MetaMask: For providing a seamless wallet integration to interact with Ethereum DApps.

---

This concludes the README for the **Decentralized Note App**. If you need any further assistance, feel free to ask!
