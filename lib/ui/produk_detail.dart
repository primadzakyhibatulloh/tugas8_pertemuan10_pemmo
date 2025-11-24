import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  final Produk? produk;

  const ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk Prima'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kode : ${widget.produk!.kodeProduk}",
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10),
              Text(
                "Nama : ${widget.produk!.namaProduk}",
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10),
              Text(
                "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20),
              _tombolHapusEdit()
            ],
          ),
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text("EDIT", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(
                  produk: widget.produk!,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text("DELETE", style: TextStyle(color: Colors.white)),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Konfirmasi Hapus"),
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text("Ya", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}