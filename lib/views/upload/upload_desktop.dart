part of upload_view;

class _UploadDesktop extends StatelessWidget {
  final UploadViewModel viewModel;
  
  _UploadDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UploadDesktop'),
      ),
    );
  }
}
