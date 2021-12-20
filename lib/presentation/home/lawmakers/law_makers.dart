import 'package:flutter/material.dart';

class LawMakersView extends StatelessWidget {
  const LawMakersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        //TODO:  the desc. screen
        //I commented this code cause I dont know what is the use of it yet @josh4500

        //This is the screen that shows the description of the lawmaker
        // Navigator.of(context)
        //     .pushReplacement(MaterialPageRoute(builder: (cxt) => Text(''));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 100,
              width: width,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 8, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 90,
                            width: width / 4,
                            decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                image: DecorationImage(
                                    image: NetworkImage('url'))),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 15),
                        //   child: ,
                        // )
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ',',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Abia Central District (APC)',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
