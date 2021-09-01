// =================================================== 

  // adding a list to the document
  const ul = document.createElement('ul')
  for (let i = 0; i < 3; i++) {
    let li = document.createElement('li')
    li.innerHTML = (i + 1).toString()
    ul.appendChild(li)
  }

  element.appendChild(ul)

// =================================================== 

  function renderListChildren(parent, ...listItems) {
    const ul = document.createElement('ul')
    for (const [i, val] of listItems) {
      let li = document.createElement('li')
      li.innerHTML = val.toString()
      ul.appendChild(li)
    }
    return parent.appendChild(ul);
  }

// =================================================== 

    var list = document.querySelector('#list')
    var fruits = ['Apple', 'Orange', 'Banana', 'Melon']

    var fragment = new DocumentFragment()
    fruits.forEach(function (fruit) {
      var li = document.createElement('li')
      li.innerHTML = fruit
      fragment.appendChild(li)
    })
    list.appendChild(fragment)

// =================================================== 

// =================================================== 

// =================================================== 
  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     DOM Methods
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
      document.createDocumentFragment();
      document.createElement(elem);
      document.createTextNode(data);
      document.getElementById('id');
      document.getElementsByClassName('className');
      document.getElementsByTagName('tagName');
      document.querySelector('selector');
      document.querySelectorAll('selector');

      element.setAttribute('attrName', 'value');
      const attribute = element.getAttribute('attrName');
      element.hasAttribute('attrName')
      element.removeAttribute('attrName');
      element.toggleAttribute('attrName');
      element.matches('selectorString')
      element.innerHTML = 'DOMString';
      element.outerHTML = 'DOMString';
      element.innerText = 'renderText';
      element.classList.add('className');
      element.classList.contains('className');
      element.classList.remove('className');
      element.classList.toggle('className');

      element.insertAdjacentHTML('beforebegin', 'DOMString');
      element.insertAdjacentHTML('afterend', 'DOMString');
      element.insertAdjacentHTML('afterbegin', 'DOMString');
      element.insertAdjacentHTML('beforeend', 'DOMString');
      element.insertAdjacentElement('beforebegin', element);
      element.insertAdjacentElement('afterend', element);
      element.insertAdjacentElement('afterbegin', element);
      element.insertAdjacentElement('beforeend', element);
      element.insertAdjacentText('beforebegin', value);
      element.insertAdjacentText('afterend', value);
      element.insertAdjacentText('afterbegin', value);
      element.insertAdjacentText('beforeend', value);

      const nodeList = node.childNodes;
      const parentElement = node.parentElement;
      const parentNode = node.parentNode;
      const childNode = node.firstChild;
      const childNode = node.lastChild;
      const previousNode = node.previousSibling;
      const nextNode = node.nextSibling;
      element.textContent = 'content';
      const prevNode = NonDocumentTypeChildNode.previousElementSibling;
      const nextNode = NonDocumentTypeChildNode.nextElementSibling;
      const closestElement = targetElement.closest('selectorString');
      node.insertBefore(newNode, referenceNode);
      node.appendChild(element);

      const newClone = node.cloneNode(true);
      const root = node.getRootNode(true);
      const compareMask = node.compareDocumentPosition(otherNode);
      node.contains(otherNode);
      node.removeChild(child);
      parentNode.replaceChild(newChild, oldChild);
      node.hasChildNodes()
      const element = parentNode.firstElementChild;
      const element = parentNode.lastElementChild;
      const count = parentNode.childElementCount;
      const children = parentNode.children;
      parentNode.append(Nodes/DOMStrings);
      parentNode.prepend(Nodes/DOMStrings);
      childNode.before(Nodes/DOMStrings);
      childNode.after(Nodes/DOMStrings);
      childNode.remove();
      childNode.replaceWith(Node/DOMString);

      const rectCollection = element.getClientRects();
      const do mRect = element.getBoundingClientRect();
// =================================================== 