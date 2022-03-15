const res = db.ClientesPruebas.deleteMany({
    $or: [
        {
            Nacimiento: {
                $gt: 1985,
            },
        },
        {
            Edad: {
                $lt: 2022 - 1985,
            },
        },
    ],
});

console.log('\nCLIENTES BORRADOS NACIDOS DESPUES DE 1985');
console.log(res);
console.log('\n');
