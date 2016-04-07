echo
echo =================
echo "Create index=sample_new and update mapping of tags field"
echo =================
curl -XDELETE localhost:9200/sample_new
curl -XPOST 'localhost:9200/sample_new' -d '{
 "mappings" : {
  "videos" : {
   "properties" : {
    "tags" : { "type" : "string", "index" : "not_analyzed" }
   }
  }
 }
}'
echo
echo =================
echo "index the sample documents"
echo =================
cd ./sample-documents
for file in *.json; do
  echo -n $file
  curl -XPOST localhost:9200/sample_new/videos/ -d "`cat $file`"
  echo
done