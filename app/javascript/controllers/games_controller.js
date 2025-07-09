import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  connect() {
    this.board = ['', '', '', '', '', '', '', '', ''];
    this.currentPlayer = 'X';
    this.winningCombos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [0, 4, 8],
      [2, 4, 6],
      [2, 5, 8]
    ]
  }

  play(e){
      if(e.target.innerText === ''){
      e.target.innerText = this.currentPlayer;
      const index = parseInt(e.target.dataset.index)
      this.board[index] = this.currentPlayer;
      this.winner = this.checkWinner();
        if(this.winner){
            alert(`Player ${this.winner} wins!`);
        } else if(this.draw()){
            alert('It\'s a draw!');
        } else {
            this.nextTurn();
      }

    }
  }

    checkWinner() {
        const winner = this.winningCombos.find(combo =>
            combo.every(index => this.board[index] === 'X') ||
            combo.every(index => this.board[index] === 'O')
        );

        if (winner) {
            return this.board[winner[0]];
        }
        return null;
    }

  nextTurn(){
    this.currentPlayer = this.currentPlayer === 'X' ? 'O' : 'X';
  }

  draw(){
    return this.board.every(cell => cell !== '');
  }
}
