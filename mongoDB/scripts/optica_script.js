conn = new Mongo();
db = conn.getDB("optical_store")

db.createCollection("clients")

let clients = [{
  "_id": new ObjectId("6565de0cafa742f40cbc79b7"),
  "name": "Marlon Bundo",
  "adress": {
    "street": "Avenue NW Washington",
    "number": "1600",
    "floor": 2,
    "door": 1,
    "city": "Washington, DC",
    "zipcode": "20500",
    "country": "EEUU"
  },
  "phone": "984287349",
  "email": "marlonbundo@gmail.com",
  "registration_date": "2023-08-15",
  "recommended_client": null
}, {
  "_id": new ObjectId("6565e04aafa742f40cbc79b8"),
  "name": "Velveteen Rabbit",
  "adress": {
    "street": "Klein Street",
    "number": "360",
    "floor": 4,
    "door": 2,
    "city": "Robelside",
    "zipcode": "80646",
    "country": "EEUU"
  },
  "phone": "876125498",
  "email": "velveteenrabbit@gmail.com",
  "registration_date": "2023-10-22",
  "recommended_client": "6565de0cafa742f40cbc79b7"
}]

db.clients.insertMany(clients);

db.createCollection("employees")

let employees = [{
    "_id": new ObjectId("6565f24fafa742f40cbc79bf"),
    "name": "Max Pain"
  },
  {
    "_id": new ObjectId("6565f24fafa742f40cbc79c0"),
    "name": "Alec Azam"
  }
]

db.employees.insertMany(employees);

db.createCollection("sales")

let sales = [{
  "_id": new ObjectId("6566fb88a136258f82ece2c8"),
  "brand": {
    "name": "Saved Souls",
    "supplier": "6566f7f2a136258f82ece2c1"
  },
  "prescription": "4.0/2.0",
  "frame": "floating",
  "frame_colour": "browm",
  "glass_colour": "transparent",
  "price": 60,
  "sold_by": "6565f24fafa742f40cbc79c0",
  "client": "6565f18cafa742f40cbc79bb"
}]

db.sales.insertMany(sales);

db.createCollection("suppliers")

let suppliers = [{
    "_id": new ObjectId("6566f7f2a136258f82ece2c1"),
    "name": "Educated Bunny",
    "adress": {
      "street": "Jast Ports",
      "number": "895",
      "floor": 2,
      "door": 8,
      "city": "Loiefurt",
      "zipcode": "31250",
      "country": "EEUU"
    },
    "phone": "246831249",
    "fax": "152486379",
    "nif": "91931219N",
    "brands": [{
        "name": "BunnyWare"
      },
      {
        "name": "FluffyWhiskers"
      }
    ]
  },
  {
    "_id": new ObjectId("6566f7f2a136258f82ece2c2"),
    "name": "Hare Havens",
    "adress": {
      "street": "Ronda Reina Villa",
      "number": "122",
      "floor": 3,
      "door": 9,
      "city": "Calahorra",
      "zipcode": "03532",
      "country": "Spain"
    },
    "phone": "394857215",
    "fax": "897564231",
    "nif": "07296389F",
    "brands": [{
      "name": "Saved Souls"
    }]
  }
]

db.suppliers.insertMany(suppliers);