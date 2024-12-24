// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedNoteApp {

    // Struct to represent a note
    struct Note {
        string content;  // The content of the note
        uint256 timestamp; // The timestamp when the note was created
    }

    // Mapping to store notes by user and note ID
    mapping(address => mapping(uint256 => Note)) public userNotes;

    // Event to log note creation
    event NoteStored(address indexed user, uint256 noteId, string content, uint256 timestamp);

    uint256 public noteIdCounter;

    // Function 1: Store a new note
    function storeNote(string calldata content) external {
        require(bytes(content).length > 0, "Note content cannot be empty");

        // Create a new note and store it under the user's address
        noteIdCounter++;
        userNotes[msg.sender][noteIdCounter] = Note({
            content: content,
            timestamp: block.timestamp
        });

        // Emit event for note storage
        emit NoteStored(msg.sender, noteIdCounter, content, block.timestamp);
    }

    // Function 2: Retrieve a specific note by its ID
    function getNote(address user, uint256 noteId) external view returns (string memory content, uint256 timestamp) {
        // Retrieve the note from the user's notes
        Note storage note = userNotes[user][noteId];
        require(bytes(note.content).length > 0, "Note does not exist");

        // Return the note content and timestamp
        return (note.content, note.timestamp);
    }
}
