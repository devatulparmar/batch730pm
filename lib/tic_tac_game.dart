import 'package:flutter/material.dart';

class TicTacGame extends StatefulWidget {
  const TicTacGame({Key? key}) : super(key: key);

  @override
  State<TicTacGame> createState() => _TicTacGameState();
}

class _TicTacGameState extends State<TicTacGame> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';

  void playMove(int index) {
    if (board[index].isEmpty && winner.isEmpty) {
      setState(() {
        board[index] = currentPlayer;
        winner = checkWinner();
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
    }
  }

  String checkWinner() {
    const List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]].isNotEmpty) {
        return board[combo[0]];
      }
    }
    return board.contains('') ? '' : 'Draw';
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetGame,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (winner.isNotEmpty)
            Text(
              winner == 'Draw' ? 'It\'s a Draw!' : '$winner Wins!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 20),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
            ),
            itemCount: 9,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => playMove(index),
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      board[index],
                      style: const TextStyle(fontSize: 48, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
