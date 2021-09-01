
/* ============================================================================================= 
*  React Redux Async Requests
*  ============================================================================================= */

const REQUESTING_DATA = 'REQUESTING_DATA'
const RECEIVED_DATA = 'RECEIVED_DATA'

const requestingData = () => { return {type: REQUESTING_DATA} }
const receivedData = (data) => { return {type: RECEIVED_DATA, users: data.users} }

const handleAsync = () => {
    return function(dispatch) {
        // Dispatch request action here
        store.dispatch(requestingData())
        setTimeout(function() {
          let data = {
            users: ['Jeff', 'William', 'Alice']
          }
          // Dispatch received data action here
          store.dispatch(receivedData(data))
        }, 2500);
    }
};

const defaultState = {
  fetching: false,
  users: []
};

const asyncDataReducer = (state = defaultState, action) => {
  switch(action.type) {
    case REQUESTING_DATA:
      return {
        fetching: true,
        users: []
      }
    case RECEIVED_DATA:
      return {
        fetching: false,
        users: action.users
      }
    default:
      return state;
  }
};

const store = Redux.createStore(
  asyncDataReducer,
  Redux.applyMiddleware(ReduxThunk.default)
);



//  _____________________________________________________________________________________

const immutableReducer = (state = [0,1,2,3,4,5], action) => {
  switch(action.type) {
    case 'REMOVE_ITEM':
      // Don't mutate state here or the tests will fail
      return [ ...state.slice(0, action.index), ...state.slice(action.index + 1, state.length + 1)]
    default:
      return state;
  }
};

const removeItem = (index) => {
  return {
    type: 'REMOVE_ITEM',
    index
  }
}

const store = Redux.createStore(immutableReducer);
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________
//  _____________________________________________________________________________________