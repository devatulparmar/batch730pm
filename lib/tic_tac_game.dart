import 'package:flutter/material.dart';

class TicTacGame extends StatefulWidget {
  const TicTacGame({Key? key}) : super(key: key);

  @override
  State<TicTacGame> createState() => _TicTacGameState();
}

class _TicTacGameState extends State<TicTacGame> {
  List<String> _boardList = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';

  void playMove(int index) {
    if (_boardList[index].isEmpty && winner.isEmpty) {
      setState(() {
        _boardList[index] = currentPlayer;
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


    print(_boardList);

    /// for
    for (int i = 0; i < winningCombinations.length; i++) {
      int firstIndex = winningCombinations[i][0];
      int sndIndex = winningCombinations[i][1];
      int thirdIndex = winningCombinations[i][2];

      if (_boardList[firstIndex] == _boardList[sndIndex] && _boardList[sndIndex] == _boardList[thirdIndex] && _boardList[firstIndex].isNotEmpty) {
        print(winningCombinations[i]);
        return _boardList[firstIndex];
      }
    }

    /// for each
    // for (var item in winningCombinations) {
    //   int firstIndex = item[0];
    //   int sndIndex = item[1];
    //   int thirdIndex = item[2];
    //
    //   if (_boardList[firstIndex] == _boardList[sndIndex] && _boardList[sndIndex] == _boardList[thirdIndex] && _boardList[firstIndex].isNotEmpty) {
    //     print(item);
    //     return _boardList[firstIndex];
    //   }
    // }

    ///old code
    // for (var combo in winningCombinations) {
    //   if (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]].isNotEmpty) {
    //     return board[combo[0]];
    //   }
    // }
    return _boardList.contains('') ? '' : 'Draw';
  }

  void resetGame() {
    setState(() {
      _boardList = List.filled(9, '');
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
              childAspectRatio: 2/1,
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
                      _boardList[index],
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2/1,
            ),
            itemCount: 9,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.white),
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
