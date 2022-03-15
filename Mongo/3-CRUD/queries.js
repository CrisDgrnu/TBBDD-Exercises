const res1 = db.ClientesPruebas.find({
    $or: [
        {
            Nacimiento: {
                $gt: 1975,
            },
        },
        {
            Edad: {
                $lt: 2022 - 1975,
            },
        },
    ],
});

console.log('CLIENTES QUE HAN NACIDO DESPUES DE 1975');
console.log(res1);
console.log('\n');

const res2 = db.ClientesPruebas.find({
    $or: [
        {
            Nacimiento: {
                $gt: 1975,
            },
        },
        {
            Edad: {
                $lt: 2022 - 1975,
            },
        },
    ],
    $or: [
        {
            Amigos: {
                $gte: 5,
            },
        },
        {
            'Amigos.4': {
                $exists: true,
            },
        },
    ],
});

console.log(
    'CLIENTES QUE HAN NACIDO DESPUES DE 1975 Y TENGAN MAS DE 5 AMIGOS'
);
console.log(res2);
console.log('\n');

const res3 = db.ClientesPruebas.find({
    Amigos: {
        $elemMatch: {
            Nombre: 'María',
        },
    },
});

console.log('CLIENTES AMIGOS DE MARIA');
console.log(res3);
console.log('\n');

const res4 = db.ClientesPruebas.find({
    $and: [{ Aficiones: 'fútbol' }, { Aficiones: 'tenis' }],
});

console.log('CLIENTES CON PRIMERA AFICION FUTBOL');
console.log(res4);
console.log('\n');
