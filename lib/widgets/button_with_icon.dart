import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/providers/page_provider.dart';

class ButtonWithIcon extends StatelessWidget {
   ButtonWithIcon({
    Key? key,
    required this.color,
    required this.text,
    required this.icon,
     required this.goToPage,
     required this.Width,
     required this.isBack,
  }) : super(key: key);


  final Color color;
  final String text;
  final Icon icon;
  final int goToPage;
  final Width;
  final bool isBack;

   PagesProvider pageControllerProvider=PagesProvider();

  @override
  Widget build(BuildContext context) {
    final pageControllerProvider= Provider.of<PagesProvider>(context);
    return Container(
      width: Width,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            pageControllerProvider.goToPage(goToPage);
          },
          child: isBack==false
              ?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                text,
                style:
                const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(width: 2),
              icon,
            ],
          )
              :Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              icon,
              const SizedBox(width: 2),
              Text(
                text,
                style:
                const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          )


        ),
      ),
    );
  }
}
