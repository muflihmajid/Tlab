import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:flutter/material.dart';

String toString(int value) {
  const units = <int, String>{
    1000000000: 'B',
    1000000: 'M',
    1000: 'K',
  };
  return units.entries
      .map((e) => '${value ~/ e.key}${e.value}')
      .firstWhere((e) => !e.startsWith('0'), orElse: () => '$value');
}

class CommonListTile extends StatelessWidget {
  final String suhu,
      thumbnailImage,
      subtitle,
      humadity,
      visibility,
      speed,
      createdAt,
      city,
      description;
  final int views;
  final double imageHeight, imageWidth, overFlowWidth;
  final bool showImage, selected, enabled, isShadow;
  final VoidCallback _onPress;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonListTile(
      {Key key,
      VoidCallback onPress,
      this.isShadow = false,
      this.overFlowWidth = 0.0,
      this.city,
      this.visibility,
      this.speed,
      this.thumbnailImage,
      this.description,
      this.suhu,
      this.subtitle,
      this.humadity,
      this.createdAt,
      this.views,
      this.selected = false,
      this.enabled = true,
      this.showImage = true,
      this.imageHeight = 90,
      this.imageWidth = 100})
      : _onPress = onPress,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: _onPress,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 14),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: isShadow
                                ? AppConstants.COLOR_BLACK
                                : Colors.transparent,
                            spreadRadius: 0.1,
                            blurRadius: 5,
                            offset: Offset(1, 1))
                      ]),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(5.0),
                    child: thumbnailImage != null
                        ? Image.asset(
                            thumbnailImage,
                            scale: 3,
                          )
                        : Image.asset(
                            'lib/app/ui/assets/images/rain.png',
                            scale: 2,
                          ),
                  ),
                ),
              ],
            ),
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width - overFlowWidth,
              padding: EdgeInsets.fromLTRB(18, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        city == null ? "" : city,
                        style: TextStyle(
                            color: AppConstants.COLOR_BLACK,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          width: 115,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("Suhu: $suhu",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("Deskripsi:$description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("Kelembaban :$humadity",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                    textAlign: TextAlign.left),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text("Vis: $visibility",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text("kec: $speed",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        )
                      ],
                    )),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          createdAt,
                          style: TextStyle(
                              fontSize: 10,
                              color: AppConstants.COLOR_BLACK.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
