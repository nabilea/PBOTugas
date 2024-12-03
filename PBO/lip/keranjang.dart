import 'produk.dart';

class Keranjang {
  List<Map<String, dynamic>> daftarProduk = [];
  double total = 0; // Pastikan total bertipe double

  void tambahProduk(Produk produk, int jumlah) {
    daftarProduk.add({
      'nama': produk.nama,
      'harga': produk.harga,
      'jumlah': jumlah,
    });
    total += produk.harga * jumlah; // Total harus dihitung dengan harga yang benar
  }

  void hapusProduk(Produk produk) {
    daftarProduk.removeWhere((item) => item['nama'] == produk.nama);
    total -= produk.harga * produk.stok; // Mengurangi total sesuai harga produk yang dihapus
  }

  void tampilkanKeranjang() {
    if (daftarProduk.isEmpty) {
      print('Keranjang kosong.');
      return;
    }

    daftarProduk.forEach((produk) {
      print('Nama: ${produk['nama']}, Harga: ${produk['harga']}, Jumlah: ${produk['jumlah']}');
    });
    print('Total: Rp$total');
  }

  void checkout() {
    print('--- Checkout ---');
    print('Total Belanja: Rp$total');
    daftarProduk.clear(); // Mengosongkan keranjang setelah checkout
  }
}
