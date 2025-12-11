abstract class NavBarState {
  NavBarState(this.selectedIndex);
  final int selectedIndex;
}

class NavBarInitial extends NavBarState {
  NavBarInitial() : super(0);
}

class NavBarChangeIndex extends NavBarState {
  NavBarChangeIndex(super.selectedIndex);

}
