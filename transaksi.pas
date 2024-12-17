uses crt;

type
Barang = record
  kode: integer;
  nama: string;
  harga: integer;
end;

var
  daftarBarang: array[1..5] of Barang;
  kodeBarang, totalBelanja: integer;
  i: integer;
  barangDibeli: array[1..5] of boolean;

procedure TampilkanDaftarBarang; //prosedur utk menampilkan harga barang
begin
  writeln('Daftar Barang:');
  for i := 1 to 5 do
  begin
    writeln(daftarBarang[i].kode, '. ', daftarBarang[i].nama, ' - Rp ', daftarBarang[i].harga);
  end;
end;

function CariHargaBarang(kode: integer): integer; //fungsi utk mencari barang berdasarkan kode tiap barang
begin
  if (kode >= 1) and (kode <= 5) then
    CariHargaBarang := daftarBarang[kode - 0].harga
  else
    CariHargaBarang := 0;
end;

procedure TampilkanBarangDibeli; //prosedur utk menampilkan harga barang yg dibeli
begin
  writeln;
  writeln('Barang yang dibeli:');
  for i := 1 to 5 do
  begin
    if barangDibeli[i] then
      writeln(daftarBarang[i].nama, ' - Rp ', daftarBarang[i].harga);
  end;
end;

procedure HitungTotalBelanja; //prosedur utk menghitung total belanja
begin
  totalBelanja := 0;
  for i := 1 to 5 do
  begin
    if barangDibeli[i] then
      totalBelanja := totalBelanja + daftarBarang[i].harga;
  end;
end;

begin
  clrscr;

  daftarBarang[1].kode := 1;
  daftarBarang[1].nama := 'Sabun';
  daftarBarang[1].harga := 5000;

  daftarBarang[2].kode := 2;
  daftarBarang[2].nama := 'Shampoo';
  daftarBarang[2].harga := 15000;

  daftarBarang[3].kode := 3;
  daftarBarang[3].nama := 'Pasta Gigi';
  daftarBarang[3].harga := 8000;

  daftarBarang[4].kode := 4;
  daftarBarang[4].nama := 'Sikat Gigi';
  daftarBarang[4].harga := 12000;

  daftarBarang[5].kode := 5;
  daftarBarang[5].nama := 'Handuk';
  daftarBarang[5].harga := 25000;
  
  TampilkanDaftarBarang;
  
  for i := 1 to 5 do
    barangDibeli[i] := false;

  writeln;
  writeln('Masukkan kode barang yang ingin dibeli (0 untuk selesai):');
  repeat
    write('Kode Barang: ');
    readln(kodeBarang);
    
    if (kodeBarang >= 1) and (kodeBarang <= 5) then
    begin
      barangDibeli[kodeBarang - 0] := true;
    end
    else if kodeBarang <> 0 then
      writeln('Kode barang tidak valid!');
    
  until kodeBarang = 0;

  TampilkanBarangDibeli;
  
  HitungTotalBelanja;
  
  writeln;
  writeln('total belanja: Rp ', totalBelanja);
  writeln('terimakasih telah berbelanja !');
  
  readln;
end.
