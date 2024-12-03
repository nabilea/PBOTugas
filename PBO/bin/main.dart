import 'dart:io';
import '../lip/produk.dart';
import '../lip/keranjang.dart';
import '../lip/kasir.dart';
import '../lip/transaksi.dart';
void main() {
  Produk produk1 = Produk('Buku', 5000, 10);
  Produk produk2 = Produk('Pensil', 2000, 20);

  Keranjang keranjang = Keranjang();
  Kasir kasir = Kasir('Nabil');

  bool running = true;

  while (running) {
    print('--- Sistem POS Sederhana ---');
    print('1. Lihat Produk');
    print('2. Tambah Produk ke Keranjang');
    print('3. Hapus Produk dari Keranjang');
    print('4. Lihat Keranjang');
    print('5. Checkout');
    print('6. Laporan Penjualan');
    print('0. Keluar');
    stdout.write('Pilih menu: ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        print('1. ${produk1.nama} - Rp${produk1.harga} (Stok: ${produk1.stok})');
        print('2. ${produk2.nama} - Rp${produk2.harga} (Stok: ${produk2.stok})');
        break;
      case '2':
        stdout.write('Pilih produk (1/2): ');
        String? pilihProduk = stdin.readLineSync();
        stdout.write('Masukkan jumlah: ');
        int jumlah = int.parse(stdin.readLineSync()!);

        if (pilihProduk == '1') {
          keranjang.tambahProduk(produk1, jumlah);
        } else if (pilihProduk == '2') {
          keranjang.tambahProduk(produk2, jumlah);
        } else {
          print('Produk tidak valid.');
        }
        break;
      case '3':
        stdout.write('Hapus produk (1/2): ');
        String? pilihProduk = stdin.readLineSync();

        if (pilihProduk == '1') {
          keranjang.hapusProduk(produk1);
        } else if (pilihProduk == '2') {
          keranjang.hapusProduk(produk2);
        } else {
          print('Produk tidak valid.');
        }
        break;
      case '4':
        keranjang.tampilkanKeranjang();
        break;
      case '5':
        keranjang.checkout();
        Transaksi transaksi = Transaksi(DateTime.now(), keranjang.daftarProduk, keranjang.total.toDouble());
        kasir.tambahkanTransaksi(transaksi);
        break;
      case '6':
        kasir.cetakLaporanPenjualan();
        break;
      case '0':
        running = false;
        print('Sistem POS ditutup.');
        break;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
