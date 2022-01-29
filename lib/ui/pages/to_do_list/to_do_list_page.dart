// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'to_do_list_presenter.dart';

class ToDoListPage extends StatefulWidget {
  final ToDoListPresenter presenter;

  const ToDoListPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController textEditingController = TextEditingController();
  //

  //
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * .05),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: size.width * .05),
                width: size.width * .65,
                child: CustomTextFieldWidget(
                    labelText: "Nova tarefa",
                    controller: textEditingController,
                    size: size),
              ),
              SizedBox(
                height: size.height * .064,
                width: size.width * .2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    if (textEditingController.text.isNotEmpty) {
                      setState(() {
                        widget.presenter
                            .addTask(title: textEditingController.text);
                        textEditingController.clear();
                      });
                    }
                  },
                  child: const Text("ADD"),
                ),
              ),
            ],
          ),
          Container(height: size.height * 0.02),
          Expanded(
            child: ListView.separated(
              itemCount: widget.presenter.getListTask().length,
              separatorBuilder: (context, index) =>
                  Container(height: size.height * 0.02),
              itemBuilder: (context, index) => Dismissible(
                onDismissed: (direction) {
                  setState(() {
                    widget.presenter.removeTask(index: index);
                  });
                },
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Icon(
                          Icons.warning,
                          size: size.width * .1,
                        ),
                        content: const Text("Você realmente deseja apagar?"),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("NÃO")),
                              FlatButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("SIM"),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                key: Key(index.toString()),
                direction: DismissDirection.startToEnd,
                background: Container(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(0.65),
                  child: Align(
                    alignment: const Alignment(-0.9, 0),
                    child: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(widget.presenter.getListTask()[index].title),
                  leading: Icon(widget.presenter.getListTask()[index].isCheck
                      ? Icons.check_circle
                      : Icons.info),
                  trailing: Checkbox(
                    value: widget.presenter.getListTask()[index].isCheck,
                    onChanged: (value) {
                      setState(() {
                        widget.presenter.getListTask()[index].isCheck =
                            value ?? false;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<bool> _buildshowDialogRegistrarUser() {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) =>  AlertDialog(
//             title: const Icon(Icons.warning),
//             content: const Text("Você realmente deseja apagar?"),
//             alignment: Alignment.center,
//             actions: [
//              CupertinoDialogAction(child: const Text("Não"),onPressed: ()=> return false,),
//             CupertinoDialogAction(child: const Text("Sim"),onPressed: ()=> return true,)
//           ],
//           );
//         });
//   }




    //  showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) =>  AlertDialog(
    //         title: const Icon(Icons.warning),
    //         content: const Text("Você realmente deseja apagar?"),
    //         alignment: Alignment.center,
    //         actions: [
    //          CupertinoDialogAction(child: const Text("Não"),onPressed: ()=> return false,),
    //         CupertinoDialogAction(child: const Text("Sim"),onPressed: ()=> return true,)
    //       ],
    //       )
    //     })