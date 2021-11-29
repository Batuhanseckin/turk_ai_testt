part of user_detail_view;

class _UserDetailDesktop extends StatelessWidget {
  final UserDetailViewModel viewModel;
  
  _UserDetailDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UserDetailDesktop'),
      ),
    );
  }
}
