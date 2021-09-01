
// ========================================================================
// 	Object.assign() - Object.assign(initialObject, additionalObject, additionalObject, ...); 
	Object.assign(initialObject, additionalObject, additionalObject, ...); 
// ========================================================================
	// Cloning an Object
		const obj = { a: 1 };
		const copy = Object.assign({}, obj);

		function destructivelyUpdateObject (obj, key, value) {
		  obj[key] = value;
		  return obj;
		} 

		function nondestructivelyUpdateObject(obj, key, value){
			const newObj = {...obj};
			newObj[key] = value;
			return newObj;
		}

		let obj3 = { a: 0 , b: { c: 0}};
		JSON.stringify(obj3) // { "a": 0, "b": { "c": 0}}

	// Merging objects
		const target = { a: 1, b: 2 };
		const source = { b: 4, c: 5 };
		const returnedTarget = Object.assign(target, source);
		console.log(target); // expected output: Object { a: 1, b: 4, c: 5 }
		console.log(returnedTarget); // expected output: Object { a: 1, b: 4, c: 5 }

	// Merging objects with same properties
		const o1 = { a: 1, b: 1, c: 1 };
		const o2 = { b: 2, c: 2 };
		const o3 = { c: 3 };
		const obj = Object.assign({}, o1, o2, o3);
		console.log(obj); // { a: 1, b: 2, c: 3 }
// ========================================================================
//	forEach() 
//	 is a method of the Array prototype, which allows you to iterate over the elements of an array. 
//	 While forEach() only iterates over arrays, it can access both the value and the index of each element while iterating.

		['a', 'b', 'c'].forEach(val => console.log(val));	// a, b, c (array values)

		['a', 'b', 'c'].forEach((val, i) => console.log(i)); // 0, 1, 2 (array indexes) 

// ========================================================================
// for...in
//	is used to iterate over all enumerable properties of an object, including inherited enumerable properties.
// 	This iteration statement can be used with arrays strings or plain objects, but not with Map or Set objects.
		for (let prop in ['a', 'b', 'c'])
		  console.log(prop);            // 0, 1, 2 (array indexes)

		for (let prop in 'str')
		  console.log(prop);            // 0, 1, 2 (string indexes)

		for (let prop in {a: 1, b: 2, c: 3})
		  console.log(prop);            // a, b, c (object property names)

		for (let prop in new Set(['a', 'b', 'a', 'd']))
		  console.log(prop);            // undefined (no enumerable properties)
// ========================================================================
//	for...of
//	 is used to iterate over iterable objects, iterating over their values instead of their properties. 
//	 This iteration statement can be used with arrays, strings, Map or Set objects, but not with plain objects.
	for (let val of ['a', 'b', 'c'])
	  console.log(val);            // a, b, c (array values)

	for (let val of 'str')
	  console.log(val);            // s, t, r (string characters)

	for (let val of {a: 1, b: 2, c: 3})
	  console.log(prop);           // TypeError (not iterable)

	for (let val of new Set(['a', 'b', 'a', 'd']))
	  console.log(val);            // a, b, d (Set values)
// ========================================================================
	
// ========================================================================
	exports.isObject = isObject;
	exports.isArray = Array.isArray;
	exports.noop = function() {};
	exports.isFunction = function(value) { return typeof value === 'function';};
	exports.isString = function(value) { return typeof value === 'string' };
	exports.isUndefined = function(value) { return typeof value == 'undefined';};
	function extend(target, source) {
	  var value;
	  for (var key in source) {
	    value = source[key];
	    if (Array.isArray(value)) {
	      if (!Array.isArray(target[key])) { target[key] = []; }
	      extend(target[key], value);
	    } else if (isObject(value)) {
	      if (!isObject(value)) { target[key]  = {}; }
	      extend(target[key], value);
	    } else { target[key] = value; }
	  }
	  return target;
	}
// ========================================================================
	
// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================