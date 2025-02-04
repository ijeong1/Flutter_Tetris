import 'package:flutter/material.dart';
import 'package:fluttris/viewmodels/tetris_viewmodel.dart';

class TetrisView extends StatefulWidget {
  final TetrisViewModel viewModel;

  TetrisView({required this.viewModel});

  @override
  _TetrisViewState createState() => _TetrisViewState();
}

class _TetrisViewState extends State<TetrisView> {
  @override
  void initState() {
    super.initState();
    _startGameLoop();
  }

  void _startGameLoop() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          widget.viewModel.drop();
        });
        _startGameLoop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tetris Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.viewModel.grid[0].length,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ widget.viewModel.grid[0].length;
                int col = index % widget.viewModel.grid[0].length;
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: widget.viewModel.grid[row][col] == 1 ? Colors.blue : Colors.white,
                  ),
                );
              },
              itemCount: widget.viewModel.grid.length * widget.viewModel.grid[0].length,
            ),
          ),
          Text('Score: ${widget.viewModel.score}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: widget.viewModel.moveLeft, child: Text('Left')),
              ElevatedButton(onPressed: widget.viewModel.moveRight, child: Text('Right')),
              ElevatedButton(onPressed: widget.viewModel.rotate, child: Text('Rotate')),
              ElevatedButton(onPressed: widget.viewModel.drop, child: Text('Drop')),
              ElevatedButton(onPressed: widget.viewModel.reset, child: Text('Reset')),
            ],
          ),
        ],
      ),
    );
  }
}