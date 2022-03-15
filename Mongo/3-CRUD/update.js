const res1 = db.ClientesPruebas.updateOne(
    { Nombre: 'Ana' },
    { $unset: { Nac: '' } }
);

console.log('\nBORRADO CAMPO Nac DE ANA');
console.log(res1);
console.log(db.ClientesPruebas.find({ Nombre: 'Ana' }));
console.log('\n');

const res2 = db.ClientesPruebas.updateOne(
    { Nombre: 'Ana' },
    { $set: { Nac: 1983 } }
);

console.log('\nAÑADIDO CAMPO Nac DE ANA');
console.log(res2);
console.log(db.ClientesPruebas.find({ Nombre: 'Ana' }));
console.log('\n');

const res3 = db.ClientesPruebas.updateOne(
    { Nombre: 'Ana' },
    { $rename: { Nac: 'Nacimiento' } }
);

console.log('\nRENOMBRADO CAMPO Nac DE ANA A Nacimiento');
console.log(res3);
console.log(db.ClientesPruebas.find({ Nombre: 'Ana' }));
console.log('\n');

const res4 = db.ClientesPruebas.updateMany(
    { 'Amigos.0': { $exists: true } },
    {
        $push: {
            Amigos: {
                $each: [
                    { Nombre: 'Amigo1', Edad: 28 },
                    { Nombre: 'Amigo2', Edad: 28 },
                    { Nombre: 'Amigo3', Edad: 28 },
                ],
            },
        },
    }
);

console.log('\nAÑADIR 3 AMIGOS MAS');
console.log(res4);
console.log(
    db.ClientesPruebas.find({
        'Amigos.0': {
            $exists: true,
        },
    })
);
console.log('\n');

const res5 = db.ClientesPruebas.replaceOne(
    { Nombre: 'Ana' },
    { Nombre: 'Central Pork Cafe', Borough: 'Manhattan' }
);

console.log('\nREMPLAZADO DOCUMENTO DE ANA');
console.log(res5);
console.log('\nNUEVO');
console.log(db.ClientesPruebas.find({ Nombre: 'Central Pork Cafe' }));
console.log('\nVIEJO');
console.log(db.ClientesPruebas.find({ Nombre: 'Ana' }));
console.log('\n');

const res6 = db.ClientesPruebas.updateMany({}, { $set: { Idiomas: [] } });
const res7 = db.ClientesPruebas.updateMany(
    {},
    { $push: { Idiomas: { $each: ['Español', 'Ingles', 'Italiano'] } } }
);

console.log('\nAÑADIENDO NUEVO CAMPO');
console.log(res6);
console.log('\nAÑADIENDO IDIOMAS AL CAMPO');
console.log(res7);
console.log(db.ClientesPruebas.find({}));
console.log('\n');
