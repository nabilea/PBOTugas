import 'transaksi.dart';

class Kasir {
  String nama;
  List<Transaksi> daftarTransaksi = [];

  Kasir(this.nama);

  void tambahkanTransaksi(Transaksi transaksi) {
    daftarTransaksi.add(transaksi);
  }

  void cetakLaporanPenjualan() {
    if (daftarTransaksi.isNotEmpty) {
      print('--- Laporan Penjualan Kasir: $nama ---');
      for (var transaksi in daftarTransaksi) {
        transaksi.cetakTransaksi();
      }
    } else {
      print('Tidak ada transaksi.');
    }
  }
}
