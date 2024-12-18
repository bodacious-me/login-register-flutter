import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String ButtonText;
  void Function()? onTap;
  MyButton({super.key, required this.ButtonText,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        
        child: Center(
          child: GestureDetector(child: Text(ButtonText), onTap: onTap,),
        ),
      ),
    );
  }
}
