while getopts p:d: flag
do
    case "${flag}" in
        p) parent_dir=${OPTARG};;
        d) dir=${OPTARG};;
        ?) echo "script usage: [-p] [-d]" >&2
        exit 1
    esac
done

for i in {1..10}
do
    echo "Processing rater_$i ..."
    FILE=./data/$parent_dir/$dir/rater_$i/data.spacy
    if test -f "$FILE"; then
        python ./src/preprocessing/load_docbin_as_jsonl.py ./data/$parent_dir/$dir/rater_$i/data.spacy blank:da --ner > ./data/$parent_dir/$dir/rater_$i/data.jsonl
        echo "/data/$parent_dir/$dir/rater_$i/data.spacy has been converted to /data/$parent_dir/$dir/rater_$i/data.jsonl
        "
    else
        echo "No data for rater_$i, skipping
        "
    fi
done