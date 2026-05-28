cd Docker

docker build --platform=linux/amd64 -t docker_project:0.1.0 .

docker run --platform=linux/amd64 -it docker_project:0.1.0 bash


docker run --platform=linux/amd64 -v "$(pwd)":/data -it docker_project:0.1.0 bash



cd /data/fastq_pass

for folder in barcode*/; do
    for file in "$folder"*.fastq; do
        seqtk seq -a "$file" > "${file%.fastq}.fasta"
    done
done


cd /data/fastq_pass

for file in barcode*/*.fasta; do
    out_file="${file%.fasta}_blast_results.txt"
    
    blastn -query "$file" \
           -db /blastdb/16SMicrobial \
           -out "$out_file" \
           -outfmt 6 \
           -max_target_seqs 3 \
           -num_threads 8   
done