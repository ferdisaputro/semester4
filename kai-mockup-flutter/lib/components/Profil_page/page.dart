class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text("Ini adalah halaman $title"),
      ),
    );
  }
}
