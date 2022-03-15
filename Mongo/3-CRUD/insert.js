const { data } = require('./data');

db.ClientesPruebas.insertMany(data);

const res = db.ClientesPruebas.find({});

console.log('\nCLIENTES INSERTADOS');
console.log(res);
console.log('\n');
