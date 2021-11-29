part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: viewModel.isBusy
          ? Center(child: CircularProgressIndicator())
          : _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("Turk AI"),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: UIHelper.dynamicWidth(20)),
          child: InkWell(
            onTap: () {
              viewModel.nextUploadPage();
            },
            child: Icon(
              Icons.upload,
              size: UIHelper.dynamicSp(30),
            ),
          ),
        )
      ],
    );
  }

  Widget get _buildBody {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        separatorBuilder: _buildSeperatedItem,
        itemBuilder: _buildItem,
        itemCount: viewModel.data?.length ?? 0,
      ),
    );
  }

  Widget _buildSeperatedItem(c, i) {
    return SizedBox(
      height: UIHelper.dynamicHeight(20),
    );
  }

  Widget _buildItem(c, i) {
    late Uint8List image;
    if (viewModel.data?[i].photo != null) {
      image = base64Decode(viewModel.data![i].photo!);
    }
    return ListTile(
      onTap: () => viewModel.nextDetailPage(viewModel.data?[i].id),
      contentPadding: EdgeInsets.all(10),
      title: Text(
        (viewModel.data?[i].name ?? "null") +
            " " +
            (viewModel.data?[i].surname ?? "null"),
      ),
      leading: viewModel.data?[i].photo != null
          ? Container(
              width: 50,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: MemoryImage(image),
                ),
              ),
            )
          : null,
      subtitle: Text(viewModel.data?[i].status ?? "null"),
      trailing: Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
