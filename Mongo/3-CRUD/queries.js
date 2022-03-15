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

console.log('\nCLIENTES QUE HAN NACIDO DESPUES DE 1975');
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
    '\nCLIENTES QUE HAN NACIDO DESPUES DE 1975 Y TENGAN MAS DE 5 AMIGOS'
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

console.log('\nCLIENTES AMIGOS DE MARIA');
console.log(res3);
console.log('\n');

const res4 = db.ClientesPruebas.find({
    $and: [{ Aficiones: 'fútbol' }, { Aficiones: 'tenis' }],
});

console.log('\nCLIENTES CON PRIMERA AFICION FUTBOL');
console.log(res4);
console.log('\n');

const res5 = db.ClientesPruebas.find({
    $and: [
        {
            Amigos: {
                $elemMatch: {
                    Nombre: 'María',
                },
            },
        },
        {
            Amigos: {
                $elemMatch: {
                    Nombre: 'Luis',
                },
            },
        },
    ],
});

console.log('\nCLIENTES AMIGOS DE MARIA Y LUIS');
console.log(res5);
console.log('\n');

const res6 = db.ClientesPruebas.find({
    $or: [
        {
            Amigos: {
                $elemMatch: {
                    Nombre: 'María',
                },
            },
        },
        {
            Amigos: {
                $elemMatch: {
                    Nombre: 'Luis',
                },
            },
        },
    ],
});

console.log('\nCLIENTES AMIGOS DE MARIA O LUIS');
console.log(res6);
console.log('\n');

const res7 = db.ClientesPruebas.find({
    $nor: [
        {
            Amigos: {
                $elemMatch: {
                    Nombre: 'María',
                },
            },
        },
        {
            Amigos: {
                $elemMatch: {
                    Nombre: 'Luis',
                },
            },
        },
    ],
});

console.log('\nCLIENTES NO AMIGOS DE MARIA NI DE LUIS');
console.log(res7);
console.log('\n');

const res8 = db.ClientesPruebas.find({
    Aficiones: {
        $in: ['fútbol', 'Arqueología'],
    },
});

console.log('\nCLIENTES CON AFICIONES FUTBOL Y ARQUEOLOGIA ENTRE OTRAS');
console.log(res8);
console.log('\n');

const res9 = db.ClientesPruebas.find({
    'Aficiones.2': {
        $exists: true,
    },
});

console.log('\nCLIENTES CON AL MENOS 3 AFICIONES ');
console.log(res9);
console.log('\n');

const res10 = db.ClientesPruebas.find({
    Viajes: {
        $elemMatch: {
            Pais: 'Argentina',
            Fecha: {
                $gte: 2005,
            },
        },
    },
});

console.log('\nCLIENTES QUE HAYAN VIAJADO A ARGENTINA DESDE 2005');
console.log(res10);
console.log('\n');

const res11 = db.ClientesPruebas.find({
    url: {
        $regex: '.edu',
        $options: 's',
    },
});

console.log('\nCLIENTES CON URL ACABADA EN .EDU');
console.log(res11);
console.log('\n');
