import 'package:flutter/material.dart';

class RtoWidget extends StatelessWidget {
  final VoidCallback onPressed;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const RtoWidget({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
              child: Container(
            child: Image.asset(
              'lib/app/ui/assets/images/noconnection.png',
              width: 162,
              height: 162,
            ),
          )),
          Flexible(
            child: Text(
              'Tidak Ada Koneksi Internet',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MMC', fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Text(
              'Periksa kembali sambungan internet anda.',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'MMC', fontSize: 16),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.refresh,
                ),
                FlatButton(
                  child: Text(
                    "Silahkan Coba lagi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: onPressed,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
