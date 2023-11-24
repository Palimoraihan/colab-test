class Menu {
  int idMenu;
  String name;
  int menuOrder;
  String parent;

  Menu(
      {required this.idMenu,
      required this.name,
      required this.menuOrder,
      required this.parent});
}

class Permission {
  int idPermission;
  int idMenu;
  int read;
  int update;
  int create;

  Permission(
      {required this.idPermission,
      required this.idMenu,
      required this.read,
      required this.update,
      required this.create});
}

void main() {
  List<Menu> menuList = [
    Menu(idMenu: 1, name: 'Item A', menuOrder: 1, parent: 'Parent1'),
    Menu(idMenu: 2, name: 'Item B', menuOrder: 2, parent: 'Parent2'),
    // ... (tambahkan item lain jika ada)
  ];

  List<Permission> permissionList = [
    Permission(idPermission: 101, idMenu: 1, read: 1, update: 0, create: 1),
    // ... (tambahkan permission lain jika ada)
  ];

  List<Map<String, dynamic>> combinedList = [];

  // Menggabungkan list berdasarkan idMenu
  for (var menu in menuList) {
    Permission? permission = permissionList.firstWhere(
        (p) => p.idMenu == menu.idMenu,
        orElse: () => Permission(
            idPermission: 0, idMenu: 0, read: 0, update: 0, create: 0));
    combinedList.add({
      'idMenu': menu.idMenu,
      'name': menu.name,
      'menuOrder': menu.menuOrder,
      'parent': menu.parent,
      'idPermission': permission.idPermission,
      'read': permission.read,
      'update': permission.update,
      'create': permission.create,
    });
  }

  // Menampilkan data gabungan
  print('Data gabungan list 1 dan list 2:');
  for (var item in combinedList) {
    print(item);
  }
}
