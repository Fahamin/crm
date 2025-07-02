import 'package:crm/core/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app/modules/web_view_screen.dart';
import '../core/model/europe_PMC_article.dart';

class JournalItem extends StatelessWidget {
  EuropePMCArticle model;

  JournalItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textNormalStart(model.title, Colors.white, 18.0),
          textNormalStart(model.journal, Colors.white, 16.0),
          spaceHeight(5.0),
          textNormalStartMax1("Author: "+model.authorString, Colors.white, 13.0),
          textNormalStartMax1("Pulished Year: "+model.pubYear, Colors.white, 13.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    final url = 'https://europepmc.org/article/MED/${model.id}';
                    Get.to(() => WebViewPage(url: url));
                  },
                  child: textNormal("Read More...", Colors.blue, 15.0))
            ],
          )
        ],
      ),
    );
  }
}
