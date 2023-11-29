test() {
    ./../../2 < $1 > ../out/$1.result
}
cd in
for file in *
do
    test $file
done
