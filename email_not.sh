#!/bin/bash
# Notifications 


cd '/app/projects/CFS/CFS/SrcFiles/Banco/PaymentBatches_Confirm'
ID_I=INTCLDEG03
email=$1
errors=$(sed -n '2p' Count_Invalid.txt) ##Extraer segundo termino
sed -i -e 's@_@ @g' Notifie1_2.html #Quitar guiones
Variable=$(cat Notifie1_2.html)
sed -i -e 's@_@ @g' DetailError.html #Quitar guiones
Variable2=$(cat DetailError.html)
sed -i -e 's@_@ @g' Succ_Resume.html #Quitar guiones
Variable3=$(cat Succ_Resume.html)

if [[ ! "$errors" ]]
then
    Status="The integration $ID_I has been SUCCESSFUL"
    Subject="Payment Batches Confirmation ($ID_I - Integrity to oCloud) - SUCCESS"
emailBody="From: svc-iics-ad@fl1-eis-dsa03.utg.uvn.net
Subject: $Subject
Content-Type: text/html; charset=\"us-ascii\"
<html>
<body>
</br>
<h2> Control Figures Report for integration INTCLDEG03 IICS - ERP Cloud: Payment Batches Confirmation </H2>
</br>
$Variable
</br>
$Variable3
</br>
$Status
</br> "
echo "$emailBody" | sendmail $email

else 
    Status="The integration $ID_I was Success with errors"
    Subject="Payment Batches Confirmation ($ID_I - Integrity to oCloud) - ERROR"
    
emailBody="From: svc-iics-ad@fl1-eis-dsa03.utg.uvn.net
Subject: $Subject
Content-Type: text/html; charset=\"us-ascii\"
<html>
<body>
</br>
<h2> Control Figures Report for integration INTCLDEG03 IICS - ERP Cloud: Payment Batches Confirmation
 </H2>
</br>
$Variable
</br>
$Status
</br>
<h3> Error Detail Report for integration INTCLDEG03 IICS - ERP Cloud: Payment Batches </h3>
$Variable2 "
echo "$emailBody" | sendmail $email

fi
