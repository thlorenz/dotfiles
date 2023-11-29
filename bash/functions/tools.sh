mongo_local () {
  mongosh "mongodb://localhost:27017"
}
if_mongo_local () {
  mongosh "mongodb://localhost:27017/mainnet-accounts"
}
