import 'package:flutter/material.dart';
import 'package:gmail_clone/mailData.dart';

class MailList extends StatefulWidget {
	const MailList({
		Key ? key
	}): super(key: key);

	@override
	State < MailList > createState() => _MailListState();
}




class _MailListState extends State < MailList > {
	var mail_data = < MailData > [
    MailData(
      sender_id: ['suhani@gmail.com'],
      subject : 'Compete Weekly And Win Prizes',
      description: 'Not sure if you are ready for interviews? Participating in contests gives you real world feedback on how well you do compared to other candidates.',
      attachments: [] ,
      display_icon: "",
      // display_icon: 'https://images.livemint.com/img/2021/11/22/1600x900/Ranbir_Kapoor_1615273438826_1637558810732.jpg',
    ),
    MailData(
      sender_id: ['ruchi@gmail.com'],
      subject : 'Compete Weekly And Win Prizes',
      description: 'Not sure if you are ready for interviews? Participating in contests gives you real world feedback on how well you do compared to other candidates.',
      attachments: [] ,
      display_icon: 'https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1512936020165x278911292087286720%2FA.png?w=&h=&auto=compress&dpr=1&fit=max',
    ),
    MailData(
      sender_id: ['suryanshi@gmail.com'],
      subject : 'Compete Weekly And Win Prizes',
      description: 'Not sure if you are ready for interviews? Participating in contests gives you real world feedback on how well you do compared to other candidates.',
      attachments: [] ,
      display_icon: 'https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1512936020165x278911292087286720%2FA.png?w=&h=&auto=compress&dpr=1&fit=max',
    ),
    MailData(
      sender_id: ['piku@gmail.com'],
      subject : 'Compete Weekly And Win Prizes',
      description: 'Not sure if you are ready for interviews? Participating in contests gives you real world feedback on how well you do compared to other candidates.',
      attachments: [] ,
      display_icon: 'https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1512936020165x278911292087286720%2FA.png?w=&h=&auto=compress&dpr=1&fit=max',
    ),
    MailData(
      sender_id: ['dengre@gmail.com'],
      subject : 'Compete Weekly And Win Prizes',
      description: 'Not sure if you are ready for interviews? Participating in contests gives you real world feedback on how well you do compared to other candidates.',
      attachments: [] ,
      display_icon : "",
      // display_icon: 'https://d1muf25xaso8hp.cloudfront.net/https%3A%2F%2Fs3.amazonaws.com%2Fappforest_uf%2Ff1512936020165x278911292087286720%2FA.png?w=&h=&auto=compress&dpr=1&fit=max',
    ),
  ];

	@override
	Widget build(BuildContext context) {
    // final data = mail_data[0];
    // 	final dp=data.display_icon.isEmpty ?  Text(data.sender_id[0][0]) : Image.network(data.display_icon);
		return Scaffold(

			appBar: AppBar(

				backgroundColor: Colors.white,
				iconTheme: IconThemeData(color: Colors.grey),

				centerTitle: true,
       
				// actions: < Widget > [
        //   // CircleAvatar(child:  Text("S"), ),
        //   FlatButton(
        //     shape: CircleBorder(),
            
        //     onPressed: () {},
        //     color: Colors.amber,
        //     child: Text("S"),
          
        //   ),
        
					// 
        

				// ]
        title: Expanded(child: Center(

						child: FlatButton(

							shape: new RoundedRectangleBorder(
								borderRadius: new BorderRadius.circular(30.0),
							), onPressed: () {
								showSearch(context: context, delegate: DataSearch());
							}, child: Text("Search in emails", style: TextStyle(
								color: Colors.grey,
								fontSize: 22.0,
							), )),
					), ),
      actions :[
         FlatButton(
            shape: CircleBorder(),
            
            onPressed: () {},
            color: Colors.blue[800],
            child: Text("S" , style: TextStyle(
						color: Colors.white,
						fontWeight: FontWeight.w600,
					)),
          
          ),
      ]
			),

			body: Center(
				child: ListView.builder(itemBuilder: _itemBuilder,
					itemCount: mail_data.length, ),
			)

			,
      floatingActionButton: FloatingActionButton(
        child: Text(
          "+",style: TextStyle(
						color: Colors.white,
            fontSize: 40,
						fontWeight: FontWeight.w600,
					)
        ),
        onPressed: (){},
        backgroundColor: Colors.blue[300],
      ),
			drawer: Drawer( // Add a ListView to the drawer. This ensures the user can scroll
				// through the options in the drawer if there isn't enough vertical
				// space to fit everything.

				child: Container(

					child: ListView(
						// Important: Remove any padding from the ListView.
						padding: EdgeInsets.zero,
						children: [
							const DrawerHeader(
									decoration: BoxDecoration(
										color: Colors.blue,
									),
									child: Text('Drawer Header'),
								),
								ListTile(
									title: const Text('Item 1'),
										onTap: () {
											// Update the state of the app
											// ...
											// Then close the drawer
											Navigator.pop(context);
										},
								),
								ListTile(
									title: const Text('Item 2'),
										onTap: () {
											// Update the state of the app
											// ...
											// Then close the drawer
											Navigator.pop(context);
										},
								),
						],
					), ), )
		);
	}

	Widget _itemBuilder(BuildContext context, int index) {
		final data = mail_data[index];
    	final dp=data.display_icon.isEmpty ?  Text(data.sender_id[0][0]) : Image.network(data.display_icon);
		return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CircleAvatar(child:  dp, ),
    
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.sender_id.join(",")),
                          Text(data.subject),
    
                          Text(data.description),
                          Row(
                            children: data.attachments.map(attachmentButton).toList(),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
          ),
        );
	}

	Padding attachmentButton(String attachment) {
	  return Padding(
													padding: const EdgeInsets.only(right: 8.0),
														child: OutlinedButton(onPressed: () {}, style: ButtonStyle(
															foregroundColor: MaterialStateProperty.all < Color > (Color.fromARGB(255, 79, 77, 77)),
															shape: MaterialStateProperty.all < RoundedRectangleBorder > (
																RoundedRectangleBorder(
																	borderRadius: BorderRadius.circular(18.0),


																),

															)
														), child: Text(attachment)),
												);
	}
}

class DataSearch extends SearchDelegate < String > {
	final mailid = [
		"suhani@gmail.com",
		"pritam@gmail.com",
		"dengre@gmail.com",
		"suryanshi@gmail.com",
		"inahusp@gmail.com",
		"piku@gmail.com",
		"satyam@gmail.com",
		"agrawalsuru@gmail.com",
	];
	final recentMailid = [
		"suhani@gmail.com",
		"pritam@gmail.com",
		"dengre@gmail.com",
		"suryanshi@gmail.com",
	];

	@override
	List < Widget > buildActions(BuildContext context) {
		//actions for search bar
		return [
			// IconButton(onPressed: (){}, icon: Icon(Icons.clear))
		];

	}

	@override
	Widget ? buildLeading(BuildContext context) {
		// TODO: implement buildLeading
		return IconButton(
			icon: AnimatedIcon(
				icon: AnimatedIcons.menu_arrow,
				progress: transitionAnimation,
			),
			onPressed: () {
				close(context, "");
			},
		);

	}

	@override
	Widget buildResults(BuildContext context) {
		// show some result based on selection
		throw UnimplementedError();
	}

	@override
	Widget buildSuggestions(BuildContext context) {
		final suggestionList = query.isEmpty ? recentMailid : mailid.where((element) => element.startsWith(query)).toList();
		return ListView.builder(itemBuilder: (context, index) => ListTile(
				leading: Icon(Icons.refresh),
				title: RichText(text: TextSpan(
					text: suggestionList[index].substring(0, query.length),
					style: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.w600,
					),
					children: [TextSpan(
						text: suggestionList[index].substring(query.length),
						style: TextStyle(
							color: Colors.grey,

						),
					)],
				)),
			),
			itemCount: suggestionList.length,

		);
	}
}