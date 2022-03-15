db.ClientesPruebas.insertMany([
    {
        Nombre: 'Luis',
        Apellidos: 'Jiménez Pérez',
        Estudios: 'Administración y Dirección de Empresas',
        Edad: 52,
        Amigos: 12,
    },
    {
        Nombre: 'Pedro',
        Apellidos: 'Martínez Campo',
        Edad: 22,
        Aficiones: ['fútbol', 'tenis', 'ciclismo'],
        Amigos: [
            {
                Nombre: 'María',
                Edad: 22,
            },
            { Nombre: 'Luis', Edad: 28 },
        ],
    },
    {
        Nombre: 'Elena',
        Apellidos: 'Jiménez Pérez',
        Estudios: 'Bellas Artes',
        Nacimiento: 1996,
        Amigos: 7,
    },
    {
        Nombre: 'Pablo',
        Apellidos: 'Cuesta Sánchez',
        Estudios: 'Arqueología',
        Nacimiento: 1986,
        Edad: 36,

        Amigos: [
            {
                Nombre: 'María',
                Edad: 22,
            },
            { Nombre: 'Elena', Edad: 25 },
        ],
    },
]);

const res = db.ClientesPruebas.find({});

console.log('\nCLIENTES INSERTADOS');
console.log(res);
console.log('\n');