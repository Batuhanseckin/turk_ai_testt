part of upload_view;

class _UploadTablet extends StatelessWidget {
  final UploadViewModel viewModel;

  _UploadTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UploadTablet'),
      ),
    );
  }
}
