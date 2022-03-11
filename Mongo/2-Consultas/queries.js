const res1 = db.users.find(
    {
        Usuario: 'herni',
    },
    {
        Password: 1,
        _id: 0,
    }
);

console.log('\nPASSWORD DEL USUARIO CUYO NOMBRE ES HENRI');
console.log(res1);
console.log('\n');
