import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class HadethView extends StatefulWidget {
  static const String routeName = 'hadethView';
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethData> hadethDataList = [];

  @override
  void initState() {
    super.initState();
    loadHadethData(); // ✅ هنا بس مش في build
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/hadeth_logo.png", scale: 1),
        const Divider(),
        Text(
          "الأحاديث",
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Expanded(
          // ✅ لازم عشان ListView يشتغل جوا Column
          child: ListView.builder(
            itemCount: hadethDataList.length,
            itemBuilder: (context, index) {
              return Bounceable(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'hadethDetailsView',
                    arguments: hadethDataList[index],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hadethDataList[index].title,
                    style: theme.textTheme.bodyMedium!.copyWith(height: 1.8),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> loadHadethData() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadethDataList = content.split("#");
    for (int i = 0; i < allHadethDataList.length; i++) {
      String singleHadeth = allHadethDataList[i].trim();
      if (singleHadeth.isEmpty) continue; // ✅ تجاهل العناصر الفاضية
      int indexLength = singleHadeth.indexOf("\n");
      if (indexLength == -1) continue; // ✅ لو مفيش سطر جديد تجاهله
      String title = singleHadeth.substring(0, indexLength).trim();
      String bodyContent = singleHadeth.substring(indexLength + 1).trim();
      hadethDataList.add(HadethData(title: title, bodyContent: bodyContent));
    }
    setState(() {});
  }
}

class HadethData {
  final String title;
  final String bodyContent;
  HadethData({required this.title, required this.bodyContent});
}
