#! /bin/bash

echo "Digite o IP ou Dominio"
read ip
echo "Porta"
read porta
echo "import os,subprocess,time" > script_menor.py

cat script_menor.tmp |sed "s/IP/$ip/"|sed "s/PORTA/$porta/"|sed "s/hostIP/$ip/"|sed "s/time.sleep(30)/time.sleep(0)/" >> script_menor.py

chmod 777 script_menor.py
echo "Iniciando Script Menor"
echo ""
python3 script_menor.py
rm script_menor.py

echo "import os,subprocess,time" > script_maior.py
cat script_maior.tmp |sed "s/IP/$ip/"|sed "s/PORTA/$porta/"|sed "s/IP.txt/$ip.txt/" >> script_maior.py
chmod 777 script_maior.py
echo "Iniciando Script Maior"
echo ""
python3 script_maior.py
rm script_maior.py

echo "ACESSO OK, RETORNO HTTP 200" >> relatorio.tmp
cat "$ip.txt" |grep "\[200\]" >> relatorio.tmp

echo "ACESSO REDIRECIONADO, RETORNO HTTP 301" >> relatorio.tmp
cat "$ip.txt" |grep "\[301\]" >> relatorio.tmp
cat "$ip.txt" |sort -u > relatorio.tmp
rm "$ip.txt"
mv relatorio.tmp "$ip.txt"
