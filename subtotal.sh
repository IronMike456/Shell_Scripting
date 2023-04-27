tail -n +2 PaymentBatches_Succ.csv > tmp_myfile.txt
sort -t "," -k2,2 tmp_myfile.txt | awk -F\, '
BEGIN{OFMT="%.2f"}
FNR==1  {TMP=$2
       }
TMP!=$2 {print "--","--","--","--","--","--","--","Subtotal","=", SUM1; SUM1=SUM2=0
        }
        {TMP=$2
         SUM1+=$10
         ##SUM2+=$5
         TOT1+=$10
         ##TOT2+=$5
        }
1
END     {print "--","--","--","--","--","--","--","Subtotal","=", SUM1; SUM1=SUM2=0
         print "--","--","--","--","--","--","--","Total","=",TOT1 ## TOT2
        }
' OFS="," > tmp_sub.txt

## tail -n +4 sub.txt > tmp_sub.txt
awk 'BEGIN{print "Payment_Batch,Business_Unit,Payment_ID,Beneficiary_Number,Currency,Type_of_payment,Group_of_payment,Proposed_Date,Status,Amount"}1' tmp_sub.txt > Succ_Resume.csv 
rm -r tmp_*.txt
