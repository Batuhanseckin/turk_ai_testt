part of upload_view;

class _UploadMobile extends StatefulWidget {
  final UploadViewModel viewModel;

  _UploadMobile(this.viewModel);

  @override
  __UploadMobileState createState() => __UploadMobileState();
}

class __UploadMobileState extends State<_UploadMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      appBar: AppBar(),
    );
  }

  Widget get _buildBody {
    return Column(
      children: [
        _buildButtons,
        SizedBox(width: UIHelper.dynamicWidth(10)),
        _buildImage,
        widget.viewModel.imageFile == null ? Container() : _buildProgressBar,
        widget.viewModel.imageFile == null ? Container() : _buildSendButton,
      ],
    );
  }

  Widget get _buildProgressBar {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearPercentIndicator(
        center: Text(
          "${widget.viewModel.progressPercent.roundedPrecision(2)}%",
          style: new TextStyle(fontSize: 12.0),
        ),
        width: UIHelper.instance.screenWidth - UIHelper.dynamicWidth(18.0),
        animateFromLastPercent: true,
        lineHeight: 20.0,
        percent: widget.viewModel.progressPercent / 100,
        backgroundColor: Colors.grey,
        progressColor: Colors.blue,
      ),
    );
  }

  Widget get _buildSendButton {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                onPressed: () {
                  widget.viewModel.uploadProfileImage(context);
                },
                child: Text("upload")),
          ),
        ],
      ),
    );
  }

  Widget get _buildButtons {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton("galeri", ImageSource.gallery),
          SizedBox(width: UIHelper.dynamicWidth(10)),
          _buildButton("kamera", ImageSource.camera),
        ],
      ),
    );
  }

  Widget get _buildImage {
    return Container(
      child: widget.viewModel.imageFile == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                widget.viewModel.imageFile!,
                height: 260,
              ),
            ),
    );
  }

  Widget _buildButton(String title, ImageSource source) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          widget.viewModel.pickImage(source);
        },
        child: Text(title),
      ),
    );
  }
}
