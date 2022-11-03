#!/bin/bash

echo "digite o pid do processo:" 
read pid
sudo renice -19 $pid 
echo "O processo foi colocando em alta prioridade."
renice 19 $pid
echo "o processo foi colocado em baixa prioridade."
kill -s stop $pid
echo "o processo foi parado."
kill -s cont $pid
echo "A execução do processo foi retomada."
kill -KILL $pid
echo "o processo foi fechado imediatamente."
