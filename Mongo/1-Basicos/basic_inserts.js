// Delete the ebooks on the collection
// const deleteRes = db.ebooks.deleteMany({});
// console.log("\nDELETE RESPONSE");
// console.log(deleteRes);
// console.log("\n");

// Insert the new ones
const insertRes = db.ebooks.insertOne({
  Nombre: "Alexandre",
  Apellido: "Dumas",
  Títulos: [
    {
      Nombre: "Los tres Mosqueteros",
      Año: 1844,
    },
    {
      Nombre: "El Conde de Montecristo",
      Año: 1844,
    },
  ],
});
console.log("\nINSERT RESPONSE");
console.log(insertRes);
console.log("\n");

// Insert the new ones
const insertManyRes = db.ebooks.insertMany([
  {
    Nombre: "Alexandre",
    Apellido: "Dumas",
    Títulos: [
      {
        Nombre: "Los tres Mosqueteros",
        Año: 1844,
      },
      {
        Nombre: "El Conde de Montecristo",
        Año: 1844,
      },
    ],
  },
  {
    Author: "Alexandre Dumas, hijo",
    Titles: [
      {
        Nombre: "La Dama de las Camelias",
        Año: 1848,
      },
      {
        Nombre: "El caso Clemenceau",
        Año: 1867,
      },
    ],
  },
]);
console.log("\nINSERT RESPONSE");
console.log(insertManyRes);
console.log("\n");

// Print the result
console.log("\nPRINT RESPONSE");
console.log(db.ebooks.find().pretty());
console.log("\n");
