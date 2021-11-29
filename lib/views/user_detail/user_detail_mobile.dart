part of user_detail_view;

class _UserDetailMobile extends StatefulWidget {
  final UserDetailViewModel viewModel;

  _UserDetailMobile(this.viewModel);

  @override
  __UserDetailMobileState createState() => __UserDetailMobileState();
}

class __UserDetailMobileState extends State<_UserDetailMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.viewModel.isError
          ? Center(child: Text("Beklenmedik bir hata ile karşılaşıldı."))
          : widget.viewModel.fetchingUserDetail
              ? Center(child: CircularProgressIndicator())
              : _buildBody,
    );
  }

  Widget get _buildBody {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage,
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Name and Surname",
              content: (widget.viewModel.userDetailModel!.name ?? "null") +
                  " " +
                  (widget.viewModel.userDetailModel!.surname ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Identity Number",
              content:
                  (widget.viewModel.userDetailModel!.identityNumber ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Father Name",
              content: (widget.viewModel.userDetailModel!.fatherName ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Mother Name",
              content: (widget.viewModel.userDetailModel!.motherName ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Gender",
              content: (widget.viewModel.userDetailModel!.gender ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Birthday",
              content: (widget.viewModel.userDetailModel!.birthday ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Birth Place",
              content: (widget.viewModel.userDetailModel!.birthPlace ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Marital Status",
              content:
                  (widget.viewModel.userDetailModel!.maritalStatus ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "City",
              content: (widget.viewModel.userDetailModel!.city ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "Town",
              content: (widget.viewModel.userDetailModel!.town ?? "null"),
            ),
            SizedBox(height: UIHelper.dynamicHeight(15)),
            _buildTitleAndContent(
              title: "dateOfDeath",
              content:
                  (widget.viewModel.userDetailModel!.dateOfDeath.toString()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndContent({
    required String title,
    required String content,
  }) {
    return Row(
      children: [
        Text(
          title + " :",
          style: Theme.of(context).textTheme.headline6!.copyWith(),
        ),
        SizedBox(width: UIHelper.dynamicHeight(10)),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.black.withOpacity(.5),
                fontSize: UIHelper.dynamicSp(22),
              ),
        ),
      ],
    );
  }

  Widget get _buildImage {
    late Uint8List image;
    if (widget.viewModel.userDetailModel!.photo != null) {
      image = base64Decode(widget.viewModel.userDetailModel!.photo!);
    } else {
      return Container();
    }
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: MemoryImage(image),
        ),
      ),
    );
  }
}
