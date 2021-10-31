import 'package:flutter/material.dart';
import 'package:flutter_food/models/candidate.dart';




class poll extends StatefulWidget {
  const poll({Key? key}) : super(key: key);

  @override
  _pollState createState() => _pollState();
}

class _pollState extends State<poll> {
  late Future <List <candidate> >candidate ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/vote_hand.png",height: 80.0,),
                  ],
                ),
              ),Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("เลือกตั้ง อบต.",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                  Text("รายชื้อผู้สมัครรับเลือกตั้ง",style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text("นายกองค์การบริหารส่วนตำบลเขาพระ",style: TextStyle(fontSize:15,color: Colors.white),),
                  Text("อำเภอเมืองนตรนายยก จังหวัดนครนายก",style: TextStyle(fontSize: 15,color: Colors.white),)
                ],
              ),
              Column(children: [


              ],),



              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed:  (){
                        ;
                      },
                      child: Text('ดูผล !!!!'),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCandidateCard(BuildContext context) {
    return FutureBuilder<List<Candidate>>(
      future: _futureCandidate,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData) {
          var candidateList = snapshot.data;

          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            itemCount: candidateList!.length,
            itemBuilder: (BuildContext context, int index) {
              var candidate = candidateList[index];

              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: const EdgeInsets.all(8.0),
                elevation: 5.0,
                shadowColor: Colors.black.withOpacity(0.2),
                color: Colors.white.withOpacity(0.5),
                child: InkWell(
                  onTap: () => _handleClickCandidate(candidate),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            '${candidate.number}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            candidate.displayName,
                            style: Theme.of(context).textTheme.bodyText1
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ผิดพลาด: ${snapshot.error}'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _futureCandidate = _loadCandidates();
                    });
                  },
                  child: const Text('ลองใหม่'),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
