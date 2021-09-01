





// REDUX NOTES
// We hold our application's state in one plain old JavaScript object, and we update that state by 
// 	passing both an action and the old state to our reducer. Our reducer returns to us our new state.
// So to change our state we 
// (1) create an action (an action is just a plain object with a type key); and
// 	(2) and pass the action as an argument when we call the reducer (which is just a function with a 
// 	switch/case statement). This produces a new state.
// Our reducer is a pure function which means that given the same arguments of state and action, it will 
// 	always produce the same new state. Also it means that our reducer never updates the previous state, 
// 	but rather creates a new state object.



function reducer(state, action){      
  switch (action.type) {
    case 'INCREASE_COUNT':
      return {count: state.count + 1}
    case 'DECREASE_COUNT':
      return {count: state.count - 1}
    default:
      return state;
  }
}