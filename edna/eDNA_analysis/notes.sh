docker run --name=fishmeup \
    --volume=$(pwd):/home/data \
    --rm \
    -w /home/data \
    -it ethill/decona:latest


cd /home/data
ls


decona -f -l 170 -m 300 -q 9 -c 0.90 -n 5 -k 10 -T 2 -B fish_database.fasta