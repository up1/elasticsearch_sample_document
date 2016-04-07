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
 "size" : 3,
 "source" : {
  "index" : "sample",
  "type" : "videos",
  "query" : {
   "term" : {
    "tags" : "elasticsearch"
   }
  },
  "sort" : {
   "upload_date" : "desc"
  }
 },
 "dest" : {
  "index" : "sample_new"
 }
}'