
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapControl extends StatefulWidget {
  @override
  _TapControlState createState() => _TapControlState();
}

class _TapControlState extends State<TapControl>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              Image.asset(
                'assets/tap.png',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 102,
                left: 108,
                child: Container(
                  height:_isPlaying==true? _controller.value*100:0,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_isPlaying) {
                _controller.stop();

              } else {
                _controller.forward();
              }
              _isPlaying = !_isPlaying;
            });
          },
          child: Text(_isPlaying ? 'Stop' : 'Start'),
        ),
      ],
    );
  }
}
