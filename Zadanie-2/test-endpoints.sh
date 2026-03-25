#!/bin/bash

URL="http://localhost:8000/api/products"

echo "--- 1. Dodanie produktu ---"

RESPONSE=$(curl -s -X POST $URL \
     -H "Content-Type: application/json" \
     -d '{"name": "Produkt A", "price": 49.99, "category": 1}')

echo "$RESPONSE"

PRODUCT_ID=$(echo $RESPONSE | grep -oE '"id":[0-9]+' | grep -oE '[0-9]+')

if [ -z "$PRODUCT_ID" ]; then
    exit 1
fi

echo -e "Testowany produkt id=$PRODUCT_ID\n"

echo "--- 2. Lista wszystkich ---"
curl -X GET $URL
echo -e "\n"

echo "--- 3. Produkt ---"
curl -X GET "$URL/$PRODUCT_ID"
echo -e "\n"

echo "--- 4. Aktualizacja produktu ---"
curl -X PUT "$URL/$PRODUCT_ID" \
     -H "Content-Type: application/json" \
     -d '{"name": "Produkt B", "price": 50.00, "category": 2}'
echo -e "\n"

echo "--- 5. Produkt ---"
curl -X GET "$URL/$PRODUCT_ID"
echo -e "\n"

echo "--- 6. Usuniecie produktu ---"
curl -X DELETE "$URL/$PRODUCT_ID"
echo -e "\n"

echo "--- 6. Sprawdzenie listy po usunieciu ---"
curl -X GET $URL
echo -e "\n"