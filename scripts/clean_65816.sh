for f in $(ls)
do
    python clean_65816.py "$f" > "hi/$f"
done