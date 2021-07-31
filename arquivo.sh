#!/bin/bash

echo "        ###############################################"
echo "        ################### SCRIPT ####################"
echo "        ############## Copiando Arquivos ##############"
echo "        ################# Remotamente #################"
echo "        ###############################################"
echo " "
echo "     Voce esta executando este script do diretorio: "
diret=`pwd`
echo "============= $diret ============="
echo "     O usuario utilizado: "
user=`whoami`
echo "============= $user ============="
echo "     Aguarde..."
sleep 1
echo "     Carregando..."
sleep 3
echo "     Pronto, agora vamos pegar seus arquivos!"

echo "     Digite as máquinas que deseja acessar(não precisa separar por virgulas, apenas espaços.): "
read maquinas

maquina=($maquinas)
#echo ${maquina[@]}

echo "     Digite os nomes dos arquivos que deseja copiar(não precisa separar por virgulas, apenas espaços.): "
read arquivos

arquivo=($arquivos)
#echo ${arquivo[@]}

echo "     Em qual diretório pegar esses arquivos?(Não precisa colocar o / no final) "
read dir

echo "     E qual lugar deseja copiar? "
read cop

for i in ${maquina[@]}
do

scp root@$i:$dir/$arquivo $cop/$i
cp -iprv $cop/$i /home/log
done

exit 0
