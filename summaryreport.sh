#!/bin/bash

str_Records_received_from_Integrity=$(awk -F ',' 'NR>1{print $1}' Log.csv)
str_Records_sent_to_ERP_Cloud=$(awk -F ',' 'NR>1{print $3}' Log.csv)
str_Records_with_error=$(awk -F ',' 'NR>1{print $4}' Log.csv)

#sum column 1 values
Records_received_from_Integrity=0
for i in $str_Records_received_from_Integrity
do
    Records_received_from_Integrity=$(($Records_received_from_Integrity+$i))
done
echo $Records_received_from_Integrity

#sum column 2 values
Records_sent_to_ERP_Cloud=0
for i in $str_Records_sent_to_ERP_Cloud
do
    Records_sent_to_ERP_Cloud=$(($Records_sent_to_ERP_Cloud+$i))
done
echo $Records_sent_to_ERP_Cloud

#sum column 3 values
Records_with_error=0
for i in $str_Records_with_error
do  
    Records_with_error=$(($Records_with_error+$i))
done
echo $Records_with_error

total_received=$(cat Log.csv | wc -l)
Received=$(($total_received - 1))
echo $Received

echo "Status:,Received,Processed,Successful,Error" > FinalCounts.csv
echo "Records:, $Received,$Records_received_from_Integrity,$Records_sent_to_ERP_Cloud,$Records_with_error" >> FinalCounts.csv