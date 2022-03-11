const res1 = db.users
    .find(
        {
            Usuario: 'herni',
        },
        {
            Password: 1,
            _id: 0,
        }
    )
    .pretty();

console.log('\nPASSWORD DEL USUARIO CUYO NOMBRE ES HENRI');
console.log(res1);
console.log('\n');

const res2 = db.users
    .find(
        {
            Pedidos: {
                $size: 5,
            },
        },
        {
            Nombre: 1,
            Apellido_1: 1,
            _id: 0,
        }
    )
    .pretty();

console.log('\nNOMBRE Y PRIMER APELLIDO DE CLIENTES CON 5 PEDIDOS');
console.log(res2);
console.log('\n');

const res3 = db.users
    .find(
        {
            'Direccion.Pais': 'Mozambique',
        },
        {
            Nombre: 1,
            'Contactos.Email': 1,
            _id: 0,
        }
    )
    .pretty();

console.log('\nNOMBRE Y EMAIL DE USUARIOS QUE VIVAN EN MOZAMBIQUE');
console.log(res3);
console.log('\n');

const res4 = db.users
    .find(
        {
            'Contactos.Email': {
                $regex: '.kom',
            },
        },
        {
            'Contactos.Email': 1,
            _id: 0,
        }
    )
    .pretty();

console.log('\nCORREOS QUE TERMINAN EN .kom');
console.log(res4);
console.log('\n');

/**
 * Se puede hacer sin elemMatch, pero en el momento que haya
 * que buscar segun dos condiciones dentro de un array hay que usarlo,
 * asique mejor buscar en arrays con elemMatch siempre para evitar
 * errores en el futuro.
 *
 * https://docs.mongodb.com/manual/tutorial/query-array-of-documents/
 */
const res5 = db.users
    .find(
        {
            'Pedidos.Lineas': {
                $elemMatch: {
                    Precio: {
                        $gte: 150,
                    },
                },
            },
        },
        {
            Nombre: 1,
            Apellido_1: 1,
            _id: 0,
        }
    )
    .pretty();

console.log(
    '\nNOMBRE Y APELLIDOS DE CLIENTES QUE HAN COMPRADO PEDIDOS MÁS CAROS DE 150 EUROS'
);
console.log(res5);
console.log('\n');

const res6 = db.users
    .find(
        {
            Usuario: { $nin: ['austro', 'herni'] },
        },
        {
            Usuario: 1,
            _id: 0,
        }
    )
    .pretty();

console.log('\nDOCUMENTOS CON USUARIOS QUE NO SEAN austro NI herni');
console.log(res6);
console.log('\n');

const res7 = db.users
    .find(
        {
            Usuario: {
                $exists: true,
            },
            'Pedidos.Lineas.Nombre_Comercial': {
                $nin: ['Twist de castro', 'Mano bella'],
            },
        },
        {
            Usuario: 1,
            // 'Pedidos.Lineas.Nombre_Comercial': 1,
            _id: 0,
        }
    )
    .pretty();

console.log('\nUSUARIOS QUE NO HAYAN PEDIDO ESOS PRODUCTOS');
console.log(res7);
console.log('\n');

const res8 = db.users
    .find(
        {
            'Pedidos.Lineas.': {
                $type: 'array',
            },
        },
        {
            _id: 1,
        }
    )
    .pretty();

console.log('\nDOCUMENTOS EN LOS QUE El CAMPO LINEAS ES UN ARRAY');
console.log(res8);
console.log('\n');

const res9 = db.users
    .find(
        {
            'Pedidos.Lineas.': {
                $not: {
                    $type: 'array',
                },
            },
        },
        {
            _id: 1,
        }
    )
    .pretty();

console.log('\nDOCUMENTOS EN LOS QUE El CAMPO LINEAS NO ES UN ARRAY');
console.log(res9);
console.log('\n');

const res10 = db.users
    .find(
        {
            CampoNull: {
                $type: 10,
            },
        },
        {
            CampoNull: 1,
            _id: 1,
        }
    )
    .pretty();

console.log('\nDOCUMENTOS CON CAMPONULL A NULL ');
console.log(res10);
console.log('\n');
