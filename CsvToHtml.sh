#!/bin/bash

cd '/app/projects/CFS/CFS/SrcFiles/Banco/PaymentBatches_Confirm'
#convert csv file into html table
#reading csv file using awk command
archivo=$1
salida=$2
awk 'BEGIN{
    #use FS for file field separator
    FS=","
    #CREATE HTML TABLE WITH BORDER
    print "<TABLE border=2 style=width:auto;>"
}
#insert rows into table from file
{
    print "<TR>"
    #NF is a number of fields in each records
    for(i=1;i<=NF;i++)
    {
        #insert first row of file as header
        #NR is number of records in input file
        if(NR==1)
            print "<th align=center>" $i "</th>"
        else
            print "<td align=center>" $i "</td>"
    }
    print "</TR>"
}
END{
        print "</TABLE>"
}' $archivo > $salida

#modificar "sample.csv" al nombre del archivo csv a convertir
#modificar "output.html" por el nombre deseado