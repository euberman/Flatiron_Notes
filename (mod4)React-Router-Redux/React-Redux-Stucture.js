/* ============================================================================================= 
*  React Redux Structure
*  ============================================================================================= */


// PROVIDER
// React Redux provides <Provider />, which makes the Redux store available to the rest of your app:
  // ./App.js
  import React from 'react'
  import ReactDOM from 'react-dom'

  import { Provider } from 'react-redux'
  import store from './store'

  import App from './App'

  const rootElement = document.getElementById('root')
  ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    rootElement
  )


//  _____________________________________________________________________________________
// CONNECT
// React Redux provides a connect function for you to connect your component to the store.
// Normally, you’ll call connect in this way:
  import { connect } from 'react-redux'
  import { increment, decrement, reset } from './actionCreators'

  // const Counter = ...

  const mapStateToProps = (state /*, ownProps*/) => {
    return {
      counter: state.counter,
    }
  }

  const mapDispatchToProps = { increment, decrement, reset }

  export default connect(mapStateToProps, mapDispatchToProps)(Component)


const ADD_NOTE = 'ADD_NOTE';

const notesReducer = (state = 'Initial State', action) => {
  switch(action.type) {
    // Change code below this line
    case ADD_NOTE: {
      return action.text
    }
    // Change code above this line
    default:
      return state;
  }
};

const addNoteText = (note) => {
  // Change code below this line
  return {
    type: ADD_NOTE,
    text: note
  }
  // Change code above this line
};

const store = Redux.createStore(notesReducer);

console.log(store.getState());
store.dispatch(addNoteText('Hello!'));
console.log(store.getState());

//  _____________________________________________________________________________________


const initialState = {
  greeting: "how was your day today?"
};

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case "UPDATE": {
      const { text: greeting } = action;
      return { greeting };
    }
    default: {
      return state;
    }
  }
};

export default reducer;