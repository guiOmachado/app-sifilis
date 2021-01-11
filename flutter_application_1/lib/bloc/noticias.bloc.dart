import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class NoticiasBloc {
  StreamController noticiasController = StreamController.broadcast();

  Stream get noticeStream => noticiasController.stream;

  getNotice() {
    var notice;
    FirebaseFirestore.instance.collection('noticias').get().then((value) => {
          //notice = value,
          value.docs.forEach((element) {
            //print(element.data());
            //notice.add(element.data());
          })
        });

    print(notice.data());
  }

  void dispose() {
    noticiasController.close();
  }
}
