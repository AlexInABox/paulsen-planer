import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paulsen_planer/core/res/color.dart';
import 'package:paulsen_planer/widgets/task_group.dart';
import 'package:paulsen_planer/widgets/substitution_row.dart';
import 'package:paulsen_planer/logic/logic.dart';

class SubstitutionScreen extends StatefulWidget {
  const SubstitutionScreen({Key? key}) : super(key: key);
  @override
  State<SubstitutionScreen> createState() => _SubstitutionScreenState();
}

class _SubstitutionScreenState extends State<SubstitutionScreen> {
  @override
  void initState() {
    super.initState();
    // Reload the widget 2 seconds after launch
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    }).onError((error, stackTrace) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.indigo[200]),
            ),
            Hero(
              tag: "date",
              child: Text(
                getDate(false),
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // Your widgets here
          ],
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Hero(
              tag: "substitutionButton",
              child: TaskGroupContainer(
                onTap: () {},
                isSmall: true,
                color: Colors.indigo,
                icon: Icons.free_cancellation_rounded,
                taskCount: 0,
                taskGroup: "Vertretungsplan",
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      body: _buildBody(),
    );
  }
}

Stack _buildBody() {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _taskHeader(),
              const SizedBox(
                height: 20,
              ),
              //_substitutionTable(),
              //_substitutionPlan(),

              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 0,
                isHeader: true,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 1,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 2,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 3,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 4,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 5,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 6,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 7,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 8,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 9,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 10,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                rowIndex: 11,
              ),
              SubstitutionRowContainer(
                onTap: () {},
                color: Colors.indigo,
                isFooter: true,
                rowIndex: 12,
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Row _onGoingHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Vertretungsplan: ",
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: Text(
          "Mehr",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}

Row _taskHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SelectableText(
        "Vertretungsplan:",
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        toolbarOptions: const ToolbarOptions(
          copy: true,
          selectAll: true,
        ),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.workspace_premium,
            color: Colors.orange[400],
          ))
    ],
  );
}

Table _substitutionTable() {
  return Table(
    defaultColumnWidth: const FlexColumnWidth(1.0),
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    border: TableBorder.all(
      color: Colors.grey,
      width: 1,
      style: BorderStyle.solid,
    ),
    children: [
      TableRow(
        children: [
          const TableCell(
            child: Text(''),
          ),
          TableCell(
            child: Text(getDate(true)),
          ),
          TableCell(
            child: Text(getDateTomorrow(true)),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('1'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(1, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(2, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('2'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(2, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(2, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      //Create 8 more rows
      TableRow(
        children: [
          const TableCell(
            child: Text('3'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(3, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(3, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('4'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(4, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(4, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('5'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(5, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(5, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('6'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(6, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(6, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('7'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(7, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(7, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('8'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(8, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(8, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const TableCell(
            child: Text('9'),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(9, true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
          TableCell(
            child: FutureBuilder(
              future: getSubstitution(9, false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ),
        ],
      ),
    ],
  );
}
