docker run --name=fishmeup \
--volume=$(pwd):/home/data \
-w /home/data \
--rm \
-it ethill/decona:latest


decona -f -l 126 -m 267 -q 20 -c 0.1 -n 12 -k 101 -T 12 -B fish_database.fasta

    