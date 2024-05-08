import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_gorouter_wh_button/button_router.dart';
 
// creating StateProvider
 final selectPageIndexProvider = StateProvider((ref) => 0);

class ButtonClass extends ConsumerStatefulWidget {
  // constructor 
  const ButtonClass({super.key, required this.child});
  final Widget child;

  //we are calling the __ButtonClasStateState class
  @override
  ConsumerState<ButtonClass> createState() => __ButtonClasStateState();
}

class __ButtonClasStateState extends ConsumerState<ButtonClass> {

  void changeTab(int index) {
    switch (index) {
      //if index is matching to 0 it will call message screen
      case 0:
        context.goNamed(Screens.message.name);  
        break;
        //if index is matching to 0 it will call status screen
      case 1:
        context.goNamed(Screens.status.name);
        break;
        //if index is matching to 0 it will call group screen
      case 2:
        context.goNamed(Screens.group.name);
        break;
        //if index is matching to 0 it will call call screen
      case 3:
        context.goNamed(Screens.call.name);
        break;
        //default or nothing matches it will be message screen
      default:
        context.goNamed(Screens.message.name);
        break;
    }
    //it will initialize the value
     ref.read(selectPageIndexProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    //her we are implementation of selectPageIndexProvider
    final butind = ref.watch(selectPageIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        backgroundColor: Colors.greenAccent,
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        //her we are calling the changeTab function
        onTap: changeTab,
        //we are passing that value
        currentIndex: butind,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
