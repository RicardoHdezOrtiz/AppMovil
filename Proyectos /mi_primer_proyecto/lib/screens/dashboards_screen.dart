import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:mi_primer_proyecto/utils/global_values.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarX(
        headerBuilder: (context, extended) {
          return UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          accountName: Text('Ricardo Hernandez'),
          accountEmail: Text('23030055@itcelaya.edu.mx')
          );
        },
        extendedTheme: const SidebarXTheme(
          width: 250
        ),
        controller: SidebarXController(selectedIndex:0, extended: true),
        items: [
          SidebarXItem(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/reto');
            },
            icon: Icons.home, label: 'Challenge App'
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Panel de control'),
      ),
      body: HawkFabMenu(
        icon: AnimatedIcons.menu_arrow,
        body: Center(
          child: Text('Your content here:) '),
        ),
        items: [
          HawkFabMenuItem(
            label: 'Theme Light', 
            ontap: ()=>GlobalValues.themeMode.value = 1, 
            icon: const Icon(Icons.light_mode)
          ),
          HawkFabMenuItem(
            label: 'Theme Light', 
            ontap: (){}, 
            icon: const Icon(Icons.dark_mode)
          )
        ]
      )
    );
  }
}