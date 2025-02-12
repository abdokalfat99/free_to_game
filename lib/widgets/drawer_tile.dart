import 'package:flutter/material.dart';
import 'package:free_to_game/providers/dark_mode_provider.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget{
  const DrawerTile(
    {
      super.key,
      required this.text,
      required this.icon,
      required this.onTap,
      this.showDivider = true});
      final String text;
      final IconData icon;
      final Function onTap;

      final bool showDivider;
   @override
   Widget build (BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            onTap();
          },
          child: Consumer<DarkModeProvider>(builder:(context, dmc , child) {
            return Container(
              decoration: BoxDecoration(
                color: dmc.isDark? Colors.black:Colors.white),
              child: Padding(padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                  style: TextStyle(
                    fontSize: 20,
                    color: dmc.isDark
                  ? Colors.white
                  :Colors.black
                  ),
                  
                
                  ),
               Icon(icon,
               color: dmc.isDark? Colors.white : Colors.black)
               
                ],
              ),
              ),
              );
             }),
        ),
        if (showDivider) const Divider()
      ]
    );
   }
}