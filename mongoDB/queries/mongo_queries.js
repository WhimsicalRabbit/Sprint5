import { MongoClient } from 'mongodb';

const client = await MongoClient.connect(
  'mongodb://localhost:27017/'
);

async function run(){

  
const coll = client.db('restaurants_db').collection('restaurants');

/*——————————————————————————————————————————————————————————————————————————————————*/

//QUERY NUMBER ONE

const cursor1 = coll.find({});

//QUERY NNUMBER TWO

const cursor2 = coll.find({},{projection:{restaurant_id:1,
name:1, 
borough:1, 
cuisine:1}})

//QUERY NNUMBER THREE

const cursor3 = coll.find({}, {projection:{_id: 0, 
  restaurant_id:1, 
  name:1, 
  borough:1, 
  cuisine:1}})

//QUERY NUMBER FOUR

const cursor4 = coll.find({}, {projection:{_id:0,
restaurant_id:1,
name:1,
borough:1,
address: {zipcode:1}}})

//QUERY NUMBER FIVE

const cursor5 = coll.find({borough: "Bronx"})

//QUERY NUMBER SIX

const cursor6 = coll.find({borough: "Bronx"}).limit(5)

//QUERY NUMBER SEVEN

const cursor7 = coll.find({borough: "Bronx"})
.skip(5)
.limit(5)

//QUERY NUMBER EIGHT

const cursor8 = coll.find({
  "grades.score": {$gt: 90}})

//QUERY NUMBER NINE

const cursor9 = coll.find({
  "grades.score": {$gt: 80, $lt: 100}})

//QUERY NUMBER TEN

const cursor10 = coll.find({
  "address.coord.0": {$lt: -95.754168}})

//QUERY NUMBER ELEVEN

const cursor11 = coll.find({cuisine: {$not: /American/}},
{"grades.score": {$gt: 70}},
{"adress.coord.0": {$lt:  -65.754168}})

//QUERY NUMBER TWELVE

const cursor12 = coll.find({cuisine: {$not: /American/}},
{"grades.score": {$gt: 70}},
{"adress.coord.0": {$lt:  -65.754168}})

//QUERY NUMBER THIRTEEN

const cursor13 = coll.find({cuisine: {$not: /American/}},
{"grades.grade": "A"},
{borough: {$not: /Brooklyn/}},)
.sort( {cuisine: -1})

//QUERY NUMBER FOURTEEN

const cursor14 = coll.find({name:/^Wil/}, 
{projection: {restaurant_id: 1,
name: 1,
borough:1,
cuisine:1}})

//QUERY NUMBER FIFTEEN

const cursor15 = coll.find({name:/ces$/}, 
{projection: {restaurant_id: 1,
name: 1,
borough:1,
cuisine:1}})

//QUERY NUMBER SIXFTEEN

const cursor16 = coll.find({name:/ces$/}, 
{projection: {restaurant_id: 1,
name: 1,
borough:1,
cuisine:1}})

//QUERY NUMBER SEVENFTEEN

const cursor17 = coll.find({borough: "Bronx"}, 
{cuisine: {$in: ["American", "Chinese"]}})

//QUERY NUMBER EIGHTTEEN

const cursor18 = coll.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, 
{projection: {restaurant_id:1,
name:1,
borough:1,
cuisine:1}})

//QUERY NUMBER NINETTEEN

const cursor19 = coll.find({borough: {$nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, 
{projection: {restaurant_id:1,
name:1,
borough:1,
cuisine:1}})

//QUERY NUMBER TWENTY

const cursor20 = coll.find({"grades.score": {$lt: 10}}, 
{projection: {restaurant_id:1,
name:1,
borough:1,
cuisine:1}})

//QUERY NUMBER TWENTY ONE

const cursor21 = coll.find({$or: [{cuisine: "Seafood"}, {cuisine: "American"}, {cuisine: "Chinese"}]},
{name: /^Wil/},
{projection: {restaurant_id:1,
name:1,
borough:1,
cuisine:1}})

//QUERY NUMBER TWENTY TWO

const cursor22 = coll.find({"grades.grade":"A", "grades.score":11, "grades.date": new Date("2014-08-11T00:00:00Z")},
{projection: {restaurant_id:1,
name:1,
grades:1}})

//QUERY NUMBER TWENTY THREE  

const cursor23 = coll.find({"grades.1.grade":"A", 
"grades.score":9, 
"grades.date": new Date("2014-08-11T00:00:00Z")},
{projection: {restaurant_id:1,
name:1,
grades:1}})

//QUERY NUMBER TWENTY FOUR

const cursor24 = coll.find({"address.coord.1":{$gte:42, $lte:52}},
{projection: {restaurant_id:1,
name:1,
address: {street:1},
address: {coord:1}}})

//QUERY NUMBER TWENTY FIVE

const cursor25 = coll.find({}).sort( {name: 1} )

//QUERY NUMBER TWENTY SIX

const cursor26 = coll.find({}).sort( {name: -1} )

//QUERY NUMBER TWENTY SEVEN

const cursor27 = coll.find({}).sort( {cuisine: 1, borough: -1} )

//QUERY NUMBER TWENTY EIGHT

const cursor28 = coll.find({}, {projection: {"adress.street": 0}})

//QUERY NUMBER TWENTY NINE

const cursor29 = coll.find({"address.coord": {$type: 1}})

//QUERY NUMBER THIRTY

const cursor30 = coll.find({"grades.score": {$mod: [ 7 , 0 ]}}, 
{projection: {restaurant_id: 1,
name:1,
grades: {grade: 1}}})

//QUERY NUMBER THIRTY ONE

const cursor31= coll.find({name: /mon/}, 
{projection: {name:1,
borough:1,
"address.coord.0":true,
"address.coord.1":true,
cuisine:true}})

//QUERY NUMBER THIRTY TWO

const cursor32= coll.find({name: /^Mad/}, 
{projection: {name:1,
borough:1,
"address.coord.0":true,
"address.coord.1":true,
cuisine:true}} )

//RESULTS

const result1 = await cursor1.toArray();
const result2 = await cursor2.toArray();
const result3 = await cursor3.toArray();
const result4 = await cursor4.toArray();
const result5 = await cursor5.toArray();
const result6 = await cursor6.toArray();
const result7 = await cursor7.toArray();
const result8 = await cursor8.toArray();
const result9 = await cursor9.toArray();
const result10 = await cursor10.toArray();
const result11 = await cursor11.toArray();
const result12 = await cursor12.toArray();
const result13 = await cursor13.toArray();
const result14 = await cursor14.toArray();
const result15 = await cursor15.toArray();
const result16 = await cursor16.toArray();
const result17 = await cursor17.toArray();
const result18 = await cursor18.toArray();
const result19 = await cursor19.toArray();
const result20 = await cursor20.toArray();
const result21 = await cursor21.toArray();
const result22 = await cursor22.toArray();
const result23 = await cursor23.toArray();
const result24 = await cursor24.toArray();
const result25 = await cursor25.toArray();
const result26 = await cursor26.toArray();
const result27 = await cursor27.toArray();
const result28 = await cursor28.toArray();
const result29 = await cursor29.toArray();
const result30 = await cursor30.toArray();
const result31 = await cursor31.toArray();
const result32 = await cursor32.toArray();

await client.close();

let resultsArray = [result1, result2,result3,result4,result5,result6,result7,result8,result9,result10,result11,result12,result13,result14,result15,result16,result17,result18,result19,result20,result21,result22,result23,result24,result25,result26,result27,result28,result29,result30,result31,result32];

for (let i = 0;i<resultsArray.length;i++){
  console.log("!—————————————————————————\nRRESULT Nº"+(i+1)+":\n—————————————————————————!");
  console.log(resultsArray[i]);
 } 

}

run().catch(console.dir);