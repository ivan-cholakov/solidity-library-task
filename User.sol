pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;
import './BookFactory.sol';

contract User is BookFactory {
    event BorrowBook(uint bookId);
    event ReturnBook(uint bookId);
    
    uint[] public returnedBooks;
    
    function returnBook(address administrator, uint _bookId) public payable ownerOf(_bookId) {
        transfer(address(this), administrator, _bookId);
        emit ReturnBook(_bookId);
    }
    
    function borrowBook(address administrator, uint _bookId) public payable {
        transfer(administrator, address(this), _bookId);
        emit BorrowBook(_bookId);
    }
}
