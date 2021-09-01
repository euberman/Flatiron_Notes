JS_Fetch().js

// ========================================================================
	function fetchData() {
	  fetch(dataUrl)
	    .then(resp => resp.json())
	    .then(json => renderDogs(json))
	}

// ========================================================================
// MDN Fetch example
    const myImage = document.querySelector('img');
    let myHeaders = new Headers();
    const myInit = { method: 'GET', headers: myHeaders, mode: 'cors', cache: 'default' };
    const myRequest = new Request('flowers.jpg', myInit);
    let myResponse;

    fetch(myRequest)
	    .then(function(response) {
	      if (!response.ok) { throw new Error("HTTP error, status = " + response.status); }
	      return response.blob();
	    })
	    .then(function(blob) {
	      const objectURL = URL.createObjectURL(blob);
	      myImage.src = objectURL;
	    })
	    .catch(function(error) {
	      let p = document.createElement('p');
	      p.appendChild( document.createTextNode('Error: ' + error.message));
	      document.body.insertBefore(p, myImage);
    	});

// ========================================================================
//
	var formElement = document.querySelector("form");
	var formData = new FormData(formElement);

// ========================================================================
// Using FormData() object to get form data
	const formElem = document.querySelector('form');

	formElem.addEventListener('submit', (e) => {
	  e.preventDefault();
	  new FormData(formElem); // construct a FormData object, which fires the formdata event
	});

	formElem.addEventListener('formdata', (e) => {
	  console.log('formdata fired');
	  let data = e.formData;		// Get the form data from the event object
	  for (var value of data.values()) {
	    console.log(value);
	  }
	 
	  // submit the data via XHR
	  let request = new XMLHttpRequest();
	  request.open("POST", "/formHandler");
	  request.send(data);
	});

// ========================================================================
// CRUD basic example
	const dogUrl = 'http://localhost:3000/dogs';
	let tableBody;
	let dogForm;
	let current_dog_id;
	document.addEventListener('DOMContentLoaded', () => {
	      tableBody = document.getElementById('table-body');
	      dogForm = document.getElementById('dog-form');
	      fetchDogs();
	      prepareFormEvents(); 
	});
	function fetchDogs() {
	  fetch(dogUrl)
	    .then(resp => resp.json())
	    .then(json => renderDogs(json))
	}
	function renderDogs(dogs){
	  tableBody.innerHTML = "";
	  dogs.forEach(dog => renderDog(dog));
	}
	function renderDog(dog) {
	  const tableRow = document.createElement("tr");
	  const editBtn = document.createElement("button");
	  editBtn.innerText = "Edit Dog";
	  tableBody.append(tableRow);
	  tableRow.innerHTML = `<td>${dog.name}</td> <td>${dog.breed}</td> <td>${dog.sex}</td>`;
	  tableRow.append(editBtn);
	  editBtn.addEventListener("click", function(event) {
	      current_dog_id = dog.id;
	      dogForm.name.value = dog.name;
	      dogForm.breed.value = dog.breed;
	      dogForm.sex.value = dog.sex;
	  });
	}
	function prepareFormEvents(){
	  dogForm.addEventListener('submit', function(event){
	    const dog = {
	      name: event.target.name.value, 
	      breed: event.target.breed.value, 
	      sex: event.target.sex.value
	    };
	    const configObject = { method: "PATCH", headers: {"Content-Type": "application/json", Accept: "application/json" }, body: JSON.stringify(dog) };
	    fetch(`${dogUrl}/${current_dog_id}`, configObject)
	      .then(resp => resp.json())
	      .then(json => renderDogs(json))
	  });
}
// ========================================================================
		const beerAPI = 'http://localhost:3000/beers';
		let beerList = [];
		let currentBeerId;
		document.addEventListener('DOMContentLoaded', () => {
		  fetch(beerAPI)
		    .then((res) => res.json())
		    .then(loadBeers);
		  document
		    .querySelector('.description')
		    .addEventListener('submit', updateDescription);
		});
		function loadBeers(beers) {
		  beerList = beers;
		  populateBeerMenu(beers);
		  displayBeerDetails(beerList[0]);
		}
		function displayBeerDetails(beer) {
		  currentBeerId = beer.id;
		  document.querySelector('.beer-details h2').innerText = beer.name;
		  document.querySelector('.beer-details img').src = beer.image_url;
		  document.querySelector('.description textarea').value = beer.description;
		  renderReviews(beer.reviews);
		}
		function populateBeerMenu(beers) {
		  const nav = document.querySelector('nav ul');
		  nav.innerHTML = '';
		  beers.forEach((beer) => {
		    const menuItem = document.createElement('li');
		    menuItem.innerText = beer.name;
		    nav.append(menuItem);
		    menuItem.addEventListener('click', () => {
		      displayBeerDetails(beer);
		    })
		  });
		}
		function renderReviews(reviews) {
		  const reviewList = document.querySelector('.reviews');
		  reviewList.innerHTML = '';
		  reviews.forEach((review) => {
		    const reviewItem = document.createElement('li');
		    reviewItem.innerText = review;
		    reviewList.append(reviewItem);
		  });
		}
		function populateList(listElement, items) {
		  listElement.innerHTML = '';
		  items.forEach((item) => {
		    const li = document.createElement('li');
		    li.innerText = item;
		    listElement.append(li);
		  });
		}
		function updateDescription(e) {
		  e.preventDefault();
		  const description = e.target.children[0].value;
		  fetch(`${beerAPI}/${currentBeerId}`, {
		    body: JSON.stringify({
		      description,
		    }),
		    method: 'PATCH',
		    headers: {
		      Accepts: 'application/json',
		      'Content-type': 'application/json',
		    },
		  });
		}
// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================