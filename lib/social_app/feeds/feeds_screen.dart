import 'package:flutter/material.dart';
import 'package:social_app/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            child: Image(
              width: double.infinity,
              image : NetworkImage(
                'https://img.freepik.com/premium-photo/robot-dog-ai-intelligent-robot-wallpaper-background-illustration-electronic-pet-new-technology_327903-1912201.jpg?w=826',),
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          ListView.separated(
            itemBuilder: (context ,index) => buildPostItem(context),
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPostItem(context) => Card(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    child: Padding(
      padding: EdgeInsets.all(10.0,),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/cute-monkey-standing-cartoon-vector-icon-illustration-animal-nature-icon-isolated-flat-vector_138676-12045.jpg?t=st=1720412334~exp=1720415934~hmac=1cca63487fe5c6ea9b033f2b4788333039a3b406248ce9b7ad276fcb3b4d953c&w=740',),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Abdullah Ashraf',
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text(
                      '8 jul 2024 at 10:30pm',
                      style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_horiz,),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Text('Love is a profound and multifaceted emotion that encompasses affection,'
              'care, and deep connection. It transcends boundaries, bringing joy, compassion,'
              ' and understanding. Love nurtures relationships, inspiring acts of kindness and selflessness.',),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  Container(
                    height: 25.0,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      child: Text(
                        '#Softweare',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),),
                  ),
                  Container(
                    height: 25.0,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      child: Text(
                        '#Softweare',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),),
                  ),
                  Container(
                    height: 25.0,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      child: Text(
                        '#Softweare',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0,),
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/premium-photo/robot-dog-ai-intelligent-robot-wallpaper-background-illustration-electronic-pet-new-technology_327903-1912201.jpg?w=826',),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        size: 25.0,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '1200',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        IconBroken.Chat,
                        size: 25.0,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '120 comments',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/cute-monkey-standing-cartoon-vector-icon-illustration-animal-nature-icon-isolated-flat-vector_138676-12045.jpg?t=st=1720412334~exp=1720415934~hmac=1cca63487fe5c6ea9b033f2b4788333039a3b406248ce9b7ad276fcb3b4d953c&w=740',),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'write a comment',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      IconBroken.Heart,
                      size: 25.0,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Like',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                onTap: (){},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
