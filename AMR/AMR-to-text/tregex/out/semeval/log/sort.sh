for f in ./dryrun/*.log
do
	sort $f -nro $f
done

for f in ./evaluation/*.log
do
	sort $f -nro $f
done
