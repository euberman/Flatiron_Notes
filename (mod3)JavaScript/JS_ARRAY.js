Javascipt_Array-Methods.js


let result = items.map(item => item + " the wizard") /* Map() - Arrow Function */
let result = items.map(function(item){
	return item + "the best item";					/* Map() - Function Expression */
});


// ========================================================================
	
	function interpolate(literals, ...expressions) {
		let string = ``
		for (const [i, val] of expressions) {
			string += literals[i] + val
		}
		string += literals[literals.length - 1]

		return string
	}
// ========================================================================

	// The following code creates a two-dimensional array.

	let a = new Array(4)
	for (let i = 0; i < 4; i++) {
	  a[i] = new Array(4)
	  for (let j = 0; j < 4; j++) {
	    a[i][j] = '[' + i + ', ' + j + ']'
	  }
	}
	// This example creates an array with the following rows:
	// 	Row 0: [0, 0] [0, 1] [0, 2] [0, 3]
	// 	Row 1: [1, 0] [1, 1] [1, 2] [1, 3]
	// 	Row 2: [2, 0] [2, 1] [2, 2] [2, 3]
	// 	Row 3: [3, 0] [3, 1] [3, 2] [3, 3]
// ========================================================================
// SORTING

	sortByEarliest() {
		const sortedList = this.state.list.sort((a, b) => {
		  return a.createdAt - b.createdAt;
		});
		this.setState({
		  list: [...sortedList],
		});
	}

	sortDates(isDescending = false, dates = ["1/7/2021", "1/6/2021", "8/18/2020", "8/6/2020"]){
		let sorteddates = dates.sort((a, b) => isDescending ? new Date(b).getTime() - new Date(a).getTime() : new Date(a).getTime() - new Date(b).getTime());
		console.log(sorteddates);
		return sorteddates
	}

	sortByLatest() {
		const sortedList = this.state.list.sort((a, b) => {
		  return b.createdAt - a.createdAt;
		});
		this.setState({
		  list: [...sortedList],
		});
	}

	sortAlphabetically() {
		item.sort(function(a, b){
		  var x = a.type.toLowerCase();
		  var y = b.type.toLowerCase();
		  if (x < y) {return -1;}
		  if (x > y) {return 1;}
		  return 0;
		});
	}

	addToEnd() {
		const date = new Date();
		const nextId = this.state.toDoCounter + 1;
		const newList = [
		  ...this.state.list,
		  {id: nextId, createdAt: date},
		];
		this.setState({
		  list: newList,
		  toDoCounter: nextId,
		});
	}

	addToStart() {
		const date = new Date();
		const nextId = this.state.toDoCounter + 1;
		const newList = [
		  {id: nextId, createdAt: date},
		  ...this.state.list,
		];
		this.setState({
		  list: newList,
		  toDoCounter: nextId,
		});
	}

	function mapToNoChange(sourceArray){
	  return sourceArray.map(item => item);
	};

	function mapToDouble(sourceArray){
	  return sourceArray.map(item => currentValue * 2);
	};

	function mapToSquare(sourceArray){
	  return sourceArray.map(item => currentValue ** 2);
	};
	// ================================
	function reduceToTotal(sourceArray, startingPoint){
	  return sourceArray.reduce((total, currentValue) => {total += currentValue}, startingPoint);
	};

	function reduceToAllTrue(sourceArray){
	  return sourceArray.reduce((total, currentValue) => {currentValue * -1}, 0);
	};

	function reduceToAnyTrue(sourceArray){
	  return sourceArray.reduce((total, currentValue) => {currentValue * -1}, 0);
	};

// ========================================================================
// Filter array items based on search criteria (query)
	let fruits = ['apple', 'banana', 'grapes', 'mango', 'orange']
	function filterItems(arr, query) {
	  return arr.filter(function(el) {
	      return el.toLowerCase().indexOf(query.toLowerCase()) !== -1
	  })
	}
	console.log(filterItems(fruits, 'an'))  // ['banana', 'mango', 'orange']
// ========================================================================
	const files = [ 'foo.txt ', '.bar', '   ', 'baz.foo' ];
	const filePaths = files.reduce((acc, file) => {
	  const fileName = file.trim();
	  if(fileName) {
	    const filePath = `~/cool_app/${fileName}`;
	    acc.push(filePath);
	  }
	  return acc;
	}, []);

	// filePaths = [ '~/cool_app/foo.txt', '~/cool_app/.bar', '~/cool_app/baz.foo']
// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================
/* ======================================================================== */
/* ________________________________________________________________________ */