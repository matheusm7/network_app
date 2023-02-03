import 'package:flutter/material.dart';
import 'package:network_app/icons/util/job_card.dart';
import 'package:network_app/icons/util/recent_job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
    //[ companyName, jobTitle, logoImagePath, hourlyRate]
    ['Iber', 'Pedro', 'lib/icons/2.jpg', 45],
    ['Google', 'Murilo', 'lib/icons/4.jpg', 15],
    ['Amazon', 'Alessandra', 'lib/icons/3.jpg', 95],
  ];

  final List recentJobs = [
    //[ companyName, jobTitle, logoImagePath, hourlyRate]
    ['Dev Flutter', 'Diana', 'lib/icons/5.jpg', 10],
    ['Dev Full-stack', 'Danilo', 'lib/icons/6.jpg', 20],
    ['Dev HTML,CSS,JS', 'Matheus', 'lib/icons/1.jpg', 30],
    ['Dev Angular', 'Larissa', 'lib/icons/12.jpg', 30],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 75,
        ),
        //app bar
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          // ignore: sized_box_for_whitespace
          child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Image.asset(
                'lib/icons/menu_from_left.png',
              )),
        ),

        const SizedBox(
          height: 25,
        ),

        // discover a new path
        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            'Descubra novos programadores',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 30,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Dev Front-End, Dev Back-end, etc...',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              // ignore: sized_box_for_whitespace

              Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(color: Colors.white, IconData(0xe2b8, fontFamily: 'MaterialIcons', matchTextDirection: true)),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 20,
        ),
        //for you - job cards

        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            'Recomendados para você',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        // ignore: sized_box_for_whitespace
        Container(
          height: 160,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return JobCard(
                companyName: jobsForYou[index][0],
                jobTitle: jobsForYou[index][1],
                logoImagePath: jobsForYou[index][2],
                hourlyRate: jobsForYou[index][3],
              );
            },
          ),
        ),

        const SizedBox(
          height: 25,
        ),

        //recently add -> job tiles

        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            'Adicionados recentemente',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView.builder(
              itemCount: recentJobs.length,
              itemBuilder: (context, index) {
                return RecentJobCard(
                  companyName: recentJobs[index][0],
                  jobTitle: recentJobs[index][1],
                  logoImagePath: recentJobs[index][2],
                  hourlyRate: recentJobs[index][3],
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
