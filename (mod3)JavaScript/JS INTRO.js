JS INTRO

document.addEventListener("DOMContentLoaded", () => {});
// ========================================================================
document.getElementById()
document.getElementsByClassName()
document.getElementsByTagName()
document.querySelector();			// returns first element
document.querySelectorAll();		// returns NodeList

document.createElement('tagName');

const newHeader = document.createElement("h1");
newHeader.id = "victory"
newHeader.innerHTML = "Flatiron School is the champion!";
newHeader.className = "victory";

element.innerHTML = 'Hello, DOM!' 
element.style.backgroundColor = '#27647B';
element.classList.remove("this-is-fine");
element.classList.add("the-room-is-on-fire");

element.removeChild(ul.querySelector('li:nth-child(2)'));
element.remove();	//removes the element itself

// Interpolation in JS
`Wrapped ${gift} and added a bow!`


// ========================================================================
// Destructive
	.pop() 			// removes the last element
	.shift()		// removes the first element
	.push()			// add elements to the end
	.unshift()		// add elements to the beginning
// ========================================================================
// NonDestructive
	.slice()		// 
	.splice(start)
	.splice(start, deleteCount)
	.splice(start, deleteCount, item1, item2, ...) 
// ========================================================================
  array.push(name); 						// destructivelyAppendDriver
  array.unshift(name); 						// destructivelyPrependDriver
  array.pop();								// destructivelyRemoveLastDriver
  array.shift();							// destructivelyRemoveFirstDriver
  return [...origArray, name];					// appendDriver
  return [name, ...origArray];					// prependDriver
  return array.slice(0, array.length - 1);	// removeLastDriver
  return array.slice(1);					// removeFirstDriver
// ========================================================================
	for (['initialization']; ['condition']; ['iteration']) { ['loop body'] }
	for (let i = 0; i < n; i++) { }
  
  	let i = 0; // the initialization moved OUTSIDE the body of the loop!
  	while (i < gifts.length) { i++;}
// ========================================================================

// ========================================================================
	//
	function random(number) {
	  return Math.floor(Math.random() * number);
	}

	function getRandomInt(max) {
	  return Math.floor(Math.random() * Math.floor(max));
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

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================
