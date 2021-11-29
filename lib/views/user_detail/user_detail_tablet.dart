part of user_detail_view;

class _UserDetailTablet extends StatelessWidget {
  final UserDetailViewModel viewModel;

  _UserDetailTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UserDetailTablet'),
      ),
    );
  }
}
