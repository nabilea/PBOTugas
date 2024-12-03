class Transaksi {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  double total;

  Transaksi(this.tanggal, this.items, this.total);

  void cetakTransaksi() {
    print('--- Laporan Penjualan ---');
    print('Tanggal: $tanggal');
    for (var item in items) {
      print('${item['nama']} x${item['jumlah']} - ${item['harga'] * item['jumlah']}');
    }
    print('Total: $total');
    print('------------------------');
  }
}
