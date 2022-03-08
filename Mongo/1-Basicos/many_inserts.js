// Delete the ebooks on the collection
const deleteRes = db.ebooks.deleteMany({});
console.log("\nDELETE RESPONSE");
console.log(deleteRes);
console.log("\n");

// Insert the new ones
for (cont = 0; cont < 100; cont++) {
  db.ebooks.insertOne({
    Author: Math.random().toString(36).slice(2, 12),
    Titles: [
      {
        Nombre: Math.random().toString(36).slice(2),
        Género: genGenero(),
        Año: Math.floor(Math.random() * 215 + 1800),
      },
    ],
  });
}

function genGenero() {
  generos = ["Hombre", "Mujer"];
  return generos[Math.floor(Math.random() * generos.length)];
}

// Print the result
console.log("\nPRINT RESPONSE (20 first documents)");
console.log(db.ebooks.find().pretty());
console.log("\n");
