import 'package:login_app/utils/common_imports.dart';

class SelectRole extends StatefulWidget {
  ValueChanged getRole;
  SelectRole({super.key, required this.getRole});

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  List<String> list = <String>['Admin', 'Manager', 'Customer'];
  int selectedIndex = 0;
  String selectedRole = "Admin";
  @override
  void initState() {
    widget.getRole(selectedRole);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 0, right: 8),
        child: Wrap(
          spacing: 14,
          runSpacing: 10,
          children: List.generate(
            list.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  selectedRole = list[index];
                  widget.getRole(selectedRole);
                });
              },
              child: Container(
                height: 35,
                width: 86,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Color.fromARGB(255, 0, 0, 0)
                        : Color(0xffD3D3D3),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    list[index],
                    textAlign: TextAlign.center,
                    style: selectedIndex == index
                        ? AppFonts.w400white14
                        : AppFonts.w400black14,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
