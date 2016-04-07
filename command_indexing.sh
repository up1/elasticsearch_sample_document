echo
echo =================
echo "index the sample documents"
echo =================
cd ./sample-documents
for file in *.json; do
  echo -n $file
  curl -XPOST localhost:9200/sample/videos/ -d "`cat $file`"
  echo
done