const res1 = db.ebooks.find({
  Titles: {
    $elemMatch: {
      Año: {
        $gte: 2022 - 25,
      },
    },
  },
});

console.log("\nLIBROS ESCRITOS EN LOS ULTIMOS 25 AÑOS");
console.log(res1);
console.log("\n");

const res2 = db.ebooks.find({
  $or: [
    { Nombre: "Alexandre", Apellido: "Dumas" },
    { Author: "Alexandre Dumas" },
  ],
});

console.log("\nLIBROS ESCRITOS POR 'Alejandro Dumas'");
console.log(res2);
console.log("\n");

const res3 = db.ebooks.find({
  $and: [
    {
      $or: [{ Author: { $regex: "Dumas" } }, { Apellido: "Dumas" }],
    },
    {
      $or: [
        {
          Titles: {
            $elemMatch: {
              Año: {
                $gte: 1801,
                $lte: 1900,
              },
            },
          },
        },
        {
          //Cuidado con la puta tilde de títulos
          Títulos: {
            $elemMatch: {
              Año: {
                $gte: 1801,
                $lte: 1900,
              },
            },
          },
        },
      ],
    },
  ],
});

console.log("\nLIBROS ESCRITOS EN EL SIGLO XIX Y AUTOR CON APELLIDO 'Dumas'");
console.log(res3);
console.log("\n");
