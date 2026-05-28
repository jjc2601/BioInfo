
# Docker file here
Docker build -t 16sblast:local .

docker run --name=blastn \
--rm \
--volume=$PWD:/home \
--workdir=/home \
-it ncbi/blast:latest

blastn -query ./16S_unknown.fasta \
    -db /blast/blastdb/16S_ribosomal_RNA \
    -out ./blast_results.txt \
    -outfmt "6 qseqid pident length mismatch gapopen evalue bitscore salltitles sallseqid" \
    -max_target_seqs 5 \
    -num_threads 2



docker run --name=prokka \
--rm \
--volume=$PWD:/data \
-it staphb/prokka:latest

prokka --outdir prokka_out --prefix prokka_annotation \
--cpus 8 NTM_22-11.fasta


cat *.fasta > combined.fasta




# MUSCLE
docker pull pegi3s/muscle

docker run --name=muscle \
    --rm \
    -v $PWD:/data \
    --workdir=/data \
    pegi3s/muscle -in /data/combined.fasta -out /data/musclecombined.fasta 
    

#iq tree
docker run --name=iqtree2 \
--rm \
--volume=$PWD:/home \
--workdir=/home \
staphb/iqtree2:latest iqtree2 -s musclecombined.fasta -m TEST -B 1000 -T 8


#blast
Docker build -t 16sblast:local .

docker run --name=blastn \
--rm \
--volume=$PWD:/home \
--workdir=/home \
-it 16sblast:local

blastn -query 16S_unkownNTM.fasta  \
    -db /blast/blastdb/16S_ribosomal_RNA \
    -out ./blast_results.txt \
    -outfmt "6 qseqid pident length mismatch gapopen evalue bitscore salltitles sallseqid" \
    -max_target_seqs 5 \
    -num_threads 8

