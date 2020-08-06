class videoList {
  String videoId;
  String videoTitle;
  String videoDesc;

  videoList({this.videoId, this.videoDesc, this.videoTitle});
}

List<videoList> videos = [
  videoList(
      videoId: '77XmRDtOL7c',
      videoTitle: 'Video 1',
      videoDesc:
          'Laptop is a very good device to operate upon. It has become faster over time'),
  videoList(
      videoId: 'Gtgtu2Fdo4w',
      videoTitle: 'Video 2',
      videoDesc:
          'Mobile is a very good device to operate upon. It has become faster over time'),
  videoList(
      videoId: 'lW7DWV2jST0',
      videoTitle: 'Video 3',
      videoDesc:
          'Desktop is a very good device to operate upon. It has become faster over time'),
  videoList(
      videoId: 'x8qTEMkZCPs',
      videoTitle: 'Video 4',
      videoDesc:
          'Tablet is a very good device to operate upon. It has become faster over time'),
  videoList(
      videoId: 'lyRPyRKHO8M',
      videoTitle: 'Video 5',
      videoDesc:
          'Television is a very good device to operate upon. It has become faster over time')
];
