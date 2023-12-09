conn = new Mongo();
db = conn.getDB("pizzeria")

db.createCollection("clients")

let clients = [{
    "_id": new ObjectId("6571a727c2190e76ea6608db") ,
    "name": "Thumper",
    "surname": "Cottonwood",
    "adress": {
      "street": "12 Meadow Lane Briarwood",
      "zipcode": "12345",
      "city": "Hareville",
      "region": "Burrowland"
    },
    "phone": "987587764"
  }, {
    "_id": new ObjectId("6571a727c2190e76ea6608dc"),
    "name": "Whiskers",
    "surname": "McHoppenstein",
    "adress": {
      "street": "27 Burrow Boulevard",
      "zipcode": "56789",
      "city": "Rabbitopia",
      "region": "Meadowland"
    },
    "phone": "846892648"
}]

db.clients.insertMany(clients);

db.createCollection("drinks")

let drinks = [{
    "_id": new ObjectId("6571b616c2190e76ea6608f5"),
    "name": "BunnyBerry Bliss",
    "desc": "Refreshing fruit-infused drink inspired by the playful and lively nature of rabbits.",
    "image": "./images/drinks/BBB.jpg",
    "price": 10.5
  }, {
    "_id": new ObjectId("6571b616c2190e76ea6608f6"),
    "name": "Hare's Harvest Hoppuccino",
    "desc": "Rich and flavorful coffee-based drink with a touch of seasonal spices, inspired by the elegance and swift nature of hares.",
    "image": "./images/drinks/HHH.jpg",
    "price": 10.5
  }]

  db.drinks.insertMany(drinks);

  db.createCollection("employees")

  let employees = [{
    "_id": new ObjectId("6571b1edc2190e76ea6608e7"),
    "name": "Coco",
    "surname": "Doodlewhiskers",
    "nif": "47192794Z",
    "phone": "358748951",
    "type": "cook",
    "store": "6571b055c2190e76ea6608e2"
  }, {
    "_id": new ObjectId("6571b1edc2190e76ea6608e8"),
    "name": "Cinnabun",
    "surname": "Ticklebottom",
    "nif": "27297214D",
    "phone": "358748951",
    "type": "dealer"
  }]

  db.employees.insertMany(employees);

  db.createCollection("hamburguers")

  let hamburguers = [{
    "_id": new ObjectId("6571b442c2190e76ea6608f0"),
    "name": "Azure Dragon Burge",
    "desc": "Blue-tinted bun made with natural ingredients like butterfly pea flower extract. The patty is a delicious blend of seafood with a base of grilled fish or shrimp, reflecting the blue dragon's ocean habitat. Crisp lettuce, sliced cucumber, and a zesty citrus-infused aioli to capture the essence of the creature's aquatic surroundings. A visually striking burguer with a flavorful nod to the blue dragon.",
    "image": "./images/hamburgers/ADB.jpg",
    "price": 8.58
  }, {
    "_id": new ObjectId("6571b442c2190e76ea6608f1"),
    "name": "ArachnoViper Delight Burger",
    "desc": "Char-grilled lamb patty, speckled bun to mimic the viper's scales, jalapeño-infused sauce or pepper jack cheese to represent the viper's horned features, crispy fried onions or potato sticks resembling spider legs, fresh arugula, this burger offers a bold and adventurous combination of flavors, capturing the essence of the spider-tailed horned viper in a delicious meal.",
    "image": "./images/hamburgers/AVDB.jpg",
    "price": 7.58
  }]

  db.hamburguers.insertMany(hamburguers);

  db.createCollection("orders")

  let order = {
    "_id": new ObjectId("6571b9b1c2190e76ea6608fe"),
    "date": "2018/10/15",
    "order_type": "pickup",
    "price": 8.58,
    "client": "6571a727c2190e76ea6608db",
    "products": [
      {
        "id_product": "6571b442c2190e76ea6608f0"
      }
    ],
    "delivery_time": "2018/10/15",
    "store": "6571b055c2190e76ea6608e2"
  }

  db.orders.insertOne(order);

  db.createCollection("pizzas")

  let pizzas = [{
    "_id": new ObjectId("6571b7b0c2190e76ea6608f9"),
    "name": "Oceanic Hare Haven Pizza",
    "desc": "Standard pizza dough for the base, creamy garlic and herb sauce to represent the soft and fluffy nature of the sea bunny, mozzarella cheese for the main body of the sea bunny., edible 'ears' using mushroom slices or pepperoni, thin strips of crispy seaweed to mimic the sea bunny's delicate whiskers, small pieces of shrimp or calamari to represent the sea bunny's tail, edible flowers and fresh herbs for a burst of color, reminiscent of the sea bunny's natural habitat.",
    "image": "./images/pizzas/OHHP.jpg",
    "price": 8,
    "category": "with meat"
  }, {
    "_id": new ObjectId("6571b7b0c2190e76ea6608fa"),
    "name": "Woodland Harmony Pizza",
    "desc": "traditional pizza dough for the base, olive oil and garlic base for a light and flavorful foundation, blend of mozzarella and feta cheese sautéed spinach, caramelized onions, and artichoke hearts for a savory and earthy mix representing the hare's vegetarian delights, sliced red and yellow bell peppers, cherry tomatoes, and roasted butternut squash for a colorful and sweet combination inspired by the fox's palette, assorted mushrooms for added umami and a nod to the forest floor.",
    "image": "./images/pizzas/OHHP.jpg",
    "price": 7.5,
    "category": "vegetarian"
  }]

  db.pizzas.insertMany(pizzas);

  db.createCollection("stores")

let store = {
    "_id": new ObjectId("6571b055c2190e76ea6608e2"),
    "adress": {
      "street": "42 Sylvan Lane",
      "zipcode": "67808",
      "city": "Woodland Haven",
      "region": "Wilderness Realm"
    }
  }

  db.stores.insertOne(store);