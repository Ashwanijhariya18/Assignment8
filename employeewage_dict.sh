PRESENT=1
PARTTIME=2;
WAGE_PER_HOUR=20
FULL_WORKING_HRS=8
MAX_WORKING_HOUR=40
MAX_WORKING_DAY=20

declare -A dailyWage;

function getWorkingHrs() {
	case $1 in 
		$PRESENT)
			workingHrs=$FULL_WORKING_HRS;
		;;
		$PARTTIME)
			workingHrs=$((FULL_WORKING_HRS/2))
		;;
		*)
			workingHrs=0
		;;
	esac
	echo $workingHrs;
}

totalWorkingHrs=0
day=0

while [[ $day -lt $MAX_WORKING_DAY && $totalWorkingHrs -lt $MAX_WORKING_HOUR ]]
do
	if [ $totalWorkingHrs -eq $(($MAX_WORKING_HOUR - FULL_WORKING_HRS/2)) ]
	then
		isPresent=$PARTTIME;
	else
		isPresent=$((RANDOM%3));
	fi

	empHrs=$(getWorkingHrs $isPresent);
	dailyWage["Day"$((day+1))]=$(( empHrs * WAGE_PER_HOUR ));
	totalWorkingHrs=$(( totalWorkingHrs + empHrs ));
	#echo "Total working hrs: $totalWorkingHrs"
	((day++))
done

totalSalary=$((WAGE_PER_HOUR * totalWorkingHrs))
echo "Total salary of month: $totalSalary"
echo "Total days: $day"

echo "Daily wage: ${dailyWage[@]}"
echo "Keys: " ${!dailyWage[@]}

for ((i=0;i<${#dailyWage[@]};i++))
do
	echo "Day$((i+1)) : ${dailyWage["Day"$((i+1))]}"
done

echo "------------------------------------"

for days in ${!dailyWage[@]}
do
	echo "$days : ${dailyWage[$days]}"
done
