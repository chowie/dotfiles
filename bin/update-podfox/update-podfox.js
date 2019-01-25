var parseJson = require('parse-json');
var json = '{"foo": true}';

JSON.parse(json);

parseJson(json);


parseJson(json, 'foo.json');

// you can also add the filename at a later point
try {
    parseJson(json);
} catch (err) {
    err.fileName = 'foo.json';
    throw err;
}
