#! /bin/bash

#Esse script é para auxiliar para fazer novos scripts parecidos com esse
#só que com wordlist personalizada
#a wordlist que o script usa, são as mais utilizadas
echo "Digite o IP"
read ip
echo "Porta Ex: 80"
read porta
echo "Nome do script"
read nome_script
echo "Wordlist para criar o script"
read wordlist
echo "import os,sys,subprocess,time" > "$nome_script"
echo 'print ("Aguarde...")' >> "$nome_script"
echo 'time.sleep(2)' >> "$nome_script"
echo 'print ("isso pode demorar um pouco 60 minutos")' >> "$nome_script"
echo 'print ("iniciado em ")' >> "$nome_script"
echo 'os.system("date")' >> "$nome_script"
chmod 777 "$nome_script"
for wordlist in $(cat "$wordlist")
do
	echo "Gerando script"
	echo 'subprocess.call(["./curl.sh", "IP", "PORTA/'$wordlist'", "hostIP.txt"])' >> "$nome_script"

done
echo 'print ("terminado em ")' >> "$nome_script"
echo 'os.system("date")' >> "$nome_script"
echo 'print ("Concluido")' >> "$nome_script"
echo ""
echo "Executando o script"
python3 "$nome_script"
