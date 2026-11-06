#!/bin/bash

# Skrip uji otomatis REST API menggunakan cURL (Tanpa jq)
BASE="http://localhost:8000/api/books"

echo "== Test 1: GET semua buku =="
curl -s "$BASE"

echo -e "\n\n== Test 2: POST buku baru =="
curl -s -X POST "$BASE" \
  -H "Content-Type: application/json" \
  -d '{"judul": "Bumi", "penulis": "Tere Liye", "tahun": 2014, "stok": 2}'

# Menentukan ID secara manual sesuai data yang masuk (misal ID 5)
NEW_ID=5
echo -e "\n\nID baru: $NEW_ID"

echo -e "\n== Test 3: GET buku ID $NEW_ID =="
curl -s "$BASE/$NEW_ID"

echo -e "\n\n== Test 4: PUT ubah buku =="
curl -s -X PUT "$BASE/$NEW_ID" \
  -H "Content-Type: application/json" \
  -d '{"judul": "Bumi (Revisi)", "penulis": "Tere Liye", "tahun": 2015, "stok": 3}'

echo -e "\n\n== Test 5: DELETE buku =="
curl -s -X DELETE "$BASE/$NEW_ID"

echo -e "\n\n== Test 6: Validasi error =="
curl -s -X POST "$BASE" \
  -H "Content-Type: application/json" \
  -d '{"judul": ""}'
echo ""