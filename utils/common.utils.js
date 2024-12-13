exports.getPlaceholderStringForArray = (arr) => {
    if (!Array.isArray(arr)) {
        throw new Error('Invalid input');
    }

    const placeholders = [...arr];
    return placeholders.fill('?').join(', ').trim();
}


exports.multipleColumnSet = (object) => {
    if (typeof object !== 'object') {
        throw new Error('Invalid input');
    }

    console.log(object);

    const keys = Object.keys(object);
    const values = Object.values(object);
    console.log("keys = ", keys);
    console.log("values = ", values);
    columnSet = keys.map(key => `${key} = ?`).join(', ');

    return {
        columnSet,
        values
    }
}
