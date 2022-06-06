no_of_Person=50
declare -A birth_day
echo "The birthday month and year of $no_of_Person Person are: "
for(( Person = 1; Person <= no_of_Person; Person++ ))
do
    (( birth_month = RANDOM % 12 + 1 ))
    (( birth_year = RANDOM % 2 + 92 ))
    echo "Person $Person has birthday in month $birth_month year $birth_year "

    birth_day[$birth_month]+=" ${Person}"
done

for month in ${!birth_day[@]}
do
    echo "The Person who are having birthday in month $month are: "
    for  Person in ${birth_day[$month]}
    do
        echo -n "$Person ";
    done
    echo
done
