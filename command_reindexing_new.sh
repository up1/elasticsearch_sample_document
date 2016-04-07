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
echo "Re-index data with _reindex API"
echo =================
curl -XPOST 'localhost:9200/_reindex' -d '{
 "source" : {
  "index" : "sample"
 },
 "dest" : {
  "index" : "sample_new",
  "version_type": "external"
 }
}'