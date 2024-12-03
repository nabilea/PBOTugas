class Produk {
  String nama;
  double harga;
  int stok;

  Produk(this.nama, this.harga, this.stok);

  void kurangiStok(int jumlah) {
    stok -= jumlah;
  }
}
