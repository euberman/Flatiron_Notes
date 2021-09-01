# Redux Terminology Cheat Sheet
When learning redux it can be difficult to keep track of all the terminology. The purpose of this document is to get all the various words and concepts in one place, map them to simple definitions, and provide some context on when/how you, the developer, will use and interact with each.

Anything marked in _italics_ can be considered 'going deeper' and you should be able to use and work with the library even without fully understanding. All of these concepts can definitely be researched further using the [Redux docs](https://redux.js.org) and [React-Redux docs](https://redux.js.org/docs/basics/UsageWithReact.html), in addition to [other resources](https://egghead.io/redux).

| [Redux](#redux) | [Redux Middlewares](#redux-middlewares) | [React-Redux](#react-redux) |
| --- | --- | --- |
| [store](#store) | [applyMiddleware](#applymiddleware) | [Provider](#provider) |
| [createStore](#createstore) | [redux-thunk](#redux-thunk) | [connect](#connect) |
| [state / state tree](#state--state-tree) | | [mapStateToProps](#mapstatetoprops) |
| [reducer](#reducer) | | [mapDispatchToProps](#mapdispatchtoprops) |
| [action](#action) | | |
| [action creator](#action-creator) | | |
| [types](#types) | | |
| [dispatch](#dispatch) | | |
| [combineReducers](#combinereducers) | | |


## Redux
#### store
The redux store is a plain JavaScript object that exposes a few methods such as [`dispatch`](#dispatch), `getState`, and `subscribe`. Our application's [state](#state--state-tree) is stored in the store. You won't normally interact with the store on a low level directly via these methods.  You'll have to be sure to create it once at the very start of your application with the [`createStore` function](#createstore).

#### createStore

`createStore` is the function you'll import from `'redux'` to initially create your store. It takes one argument, a [reducer function](#reducer) and returns an object, a [redux store](#store). You should call this function once and only once in your application.

Ex:
```js
import { createStore } from 'redux'
import reducer from './reducers'
/* reducer is a function defined in another file*/

const store = createStore(reducer)
```

_Going Deeper: There is a second optional argument to `createStore` which is how you would specify any middlewares being used. For more info see the [applyMiddleware](#applymiddleware) section_


#### state / state tree
One of the founding principles of redux is that the entire state of our application will be stored in a single plain JavaScript object called the state or state tree. The state is read-only, meaning you can't directly modify it. The state can be accessed by the method `getState`, a "reader" method, and modified by a [reducer function](#reducer), which is something like a "writer" method though it should always return a new copy of the state.

As your applications grow your state may grow to have more key/value pairs and become more nested. It will still always be a single object where all the state is stored.

Storing your Application state in the Redux store is an alternative to React Component level state (i.e. the state you change with `this.setState`). There are many reasons why you would want to use Redux's single state tree, as well as occasions where you may want individual React Components to manage their own state without Redux.

* [When Should I Use Redux](https://redux.js.org/docs/faq/General.html#when-should-i-use-redux)
* [Redux: Why It's Good For You](https://www.fullstackreact.com/articles/redux-with-mark-erikson/)
* [How to Choose Between Redux's Store and React's State](https://github.com/reactjs/redux/issues/1287#issuecomment-175351978)
* [You Might Not Need Redux](https://medium.com/@dan_abramov/you-might-not-need-redux-be46360cf367)
* [Should You Store Your Form State In Redux?](https://goshakkk.name/should-i-put-form-state-into-redux/)

_Going Deeper: The methods that read and modify the state have access to the state due to a closure. The `createStore` function returns an object that defines several methods. Those methods had access to the state at the time of their definition and therefore are able to access that data even though it cannot be directly accessed from outside. That's a closure!_

#### reducer
The way the state will get updated and modified is by invoking a specific function who's job it is to return the newly updated state. The store knows about this function
because it was passed as the first argument to [`createStore`](#createstore).

Note that "reducer" is not a named part of the redux library.  Any function you define who's job it is to return the new state is typically called a reducer function.

A reducer function is invoked with two arguments, the current state and an [action](#action). An action must be a plain JavaScript object. The reducer function returns a new state. I like to remember this by the idea that a reducer takes two arguments and _reduces_ them to one thing, the new state.

`state + action = new state`

You won't call the reducer function yourself, it will get invoked when the [`dispatch` function](#dispatch) is invoked.

Reducers should
* be [pure functions](https://hackernoon.com/functional-programming-concepts-pure-functions-cafa2983f757) i.e. no side effects
* always return something. Since the return value will become the new state, having the state become `undefined` will cause bugs all over your application. This is generally solved by
  * providing the function with a default argument
  * in the default case return the exact same state originally passed to the function unchanged
* typically be written with a `switch / case` statement. This is not required, but is the extremely conventional approach and makes it clear that all of the logic of the reducer function is conditional on the action's `type` property.

Bare minimum example of a reducer:
```js
const reducer = (state = {}, action) => {
  return state
}
```

More typical example of a reducer. Note that we are sure to always return a copy of the state; ES2015 often is useful here.
```js
const initialState = {
  comments: [],
  selectedCommentId: null
}

const commentsReducer = (state = initialState, action) => {
  switch (action.type){
    case 'ADD_COMMENT':
      return {
        ...state,
        comments: [
          ...state.comments, action.comment
        ]
      }
    case 'SELECT_COMMENT':
      return {
        ...state,
        selectedCommentId: action.id
      }
    default:
      return state
  }
}
```

_Going Deeper: The name "reducer" comes from the fact that it is the type of function you would pass as a callback to a `reduce` function (as in `Array.prototype.reduce`)._

#### action
An action is a plain JavaScript object that has one required key, [`type`](#types). That's it. Other key/value pairs can be included if additional information is required.

The role of an action is to _describe the way in which the state should be modified_.

Example actions:
```js
{type: 'LOGOUT_USER'}
{type: 'SELECT_COMMENT', id: 12}
```

#### action creator
An action creator is simply a function which returns an [action](#action).

An action creator can be as simple as
```js
const selectComment = (id) => {
  return {type: 'SELECT_COMMENT', id}
}
```

or contain more complex logic. When using a middleware such as [redux-thunk](#redux-thunk) it's inside of an action creator function where you would make a call to an API.

Typically you will define your action creator functions in another file, actions/index.js for example, export each function and import them into the component.

```js
// actions/index.js

export const increment = (amount) => {
  return { type: 'INCREMENT', amount: amount }
}

export const decrement = (amount) => {
  return { type: 'INCREMENT', amount: amount }
}

// MyComponent.js
import * as actions from './actions'
// 'actions' will be an object:
// {
//   increment: f(),
//   decrement: f()
// }
```


#### types
_Going Deeper: Remember that actions are an object that must have a key called 'type'. The value of this key can really be anything you are sure is unique. Typically, you will use a string which is descriptive of the current action. When finding redux resources online you may see developers define their types as constants in a types.js file like so:_

```js
// actions/types.js
export const ADD_COMMENT = 'ADD_COMMENT'
export const SELECT_COMMENT = 'SELECT_COMMENT'
```

_and import them into their reducers (and action creators) like below_

```js
import {
  ADD_COMMENT,
  SELECT_COMMENT
} from '../actions/types'

const commentsReducer = (state = initialState, action) => {
  switch (action.type){
    case ADD_COMMENT:
      return {
        ...state,
        comments: [
          ...state.comments, action.comment
        ]
      }
    case SELECT_COMMENT:
      return {
        ...state,
        selectedCommentId: action.id
      }
    default:
      return state
  }
}
```

_What would be the advantages of defining your types in this way? Consider the two following code snippets with essentially the same typo ("SLECT"), what would happen in each case?_

```js
import {
  SELECT_COMMENT
} from '../actions/types'

const commentsReducer = (state = initialState, action) => {
  switch (action.type){
    // ...
    case SLECT_COMMENT:
      return {
        ...state,
        selectedCommentId: action.id
      }
    default:
      return state
  }
}

// This will throw an error at compile time,
// it will be very descriptive:
// 'SLECT_COMMENT' is an undefined variable,
// you'll know right where to look to debug
```

```js
const commentsReducer = (state = initialState, action) => {
  switch (action.type){
    // ...
    case "SLECT_COMMENT":
      return {
        ...state,
        selectedCommentId: action.id
      }
    default:
      return state
  }
}

// There's no error in this file,
// it's all valid code.
// Debugging will be very difficult,
// your state will not be updating correctly
// and you won't be sure why.
// This bug will be difficult to find.
```

_By listing all of a file's dependencies in one place debugging should be easier and you'll be less likely to make small mistakes. That's all that's going on when you see types defined as constants; it's meant to make your life as a developer a little easier in the long run though it can seem like more work up front._

#### dispatch
The `dispatch` function from the redux store is used to send, or "dispatch", actions to the reducer.  Invoking the reducer will result in a newly updated state, since you won't manually invoke the reducer on your own, you'll do so by calling `dispatch`. `dispatch` is a function, that when called, calls the reducer function. It should be invoked with an [action](#action).

Depending on how you have connected a React component to Redux you may or may not call `dispatch` directly.

Below is a simple example, see [`mapDispatchToProps`](#mapdispatchtoprops) for more realistic examples.

```js
import React from 'react'
import ReactDOM from 'react-dom'
import { createStore } from 'redux'

const reducer = (state = 0, action) => {
  switch (action.type) {
    case 'INCREMENT':
      return state + 1
    default:
      return state
  }
}

const store = createStore(reducer)

class Counter extends React.Component {

  componentWillMount(){
    // for demo purposes only, don't worry about this too much
    store.subscribe(this.forceUpdate)
  }

  render() {
    return (
      <div>
        <h1>{store.getState()}</h1>
        <button
          onClick={() => store.dispatch({type: 'INCREMENT'})} >
          +
        </button>
      </div>
    )
  }
}


reactDOM.render(<Counter/>, document.getElementById('root'))
```

The whole flow: when the button is clicked, `dispatch` will be called with the appropriate action. `dispatch` then calls the [reducer](#reducer) function. The switch/case statement determines how to change the state and the new state is returned. Because the Redux state has changed, the component knows to update / re-render.

_Going Deeper: We can build a pretty simple working model of how `dispatch` must be implemented. We know 1) it's expecting to be called with an action, 2) it calls the reducer 3) after the reducer is called we need to let other pieces of the app know the redux state has changed. It looks something like this:_

```js
let state;
const functionsThatNeedToBeCalledWhenTheStateChanges = [];

const dispatch = (action) => {
  state = reducer(state, action);
  functionsThatNeedToBeCalledWhenTheStateChanges.forEach(f => f());
};
```

#### combineReducers

Your [state tree](#state--state-tree) will grow rapidly as your application grows. Below is an example of just the top level of the state tree for Twitter (see more here: [Dissecting Twitter's Redux Store](https://medium.com/statuscode/dissecting-twitters-redux-store-d7280b62c6b1)):

![twitter redux store](https://cdn-images-1.medium.com/max/300/1*AfWNKt97vBGKF4RK5KajYA.png)

Obviously, having one massive [reducer function](#reducer) to manage all of this would be totally unwieldy, but the whole point of Redux is that the state tree is represented by one single object and stored in one single place.

`combineReducers` is meant to solve exactly this problem. You import it from the 'redux' library and it allows you to write separate reducers, in different files if you'd like, that each are responsible for a small and manageable slice of your state.

`combineReducers` is a function that should be passed an object. The keys of the object will be the top level keys of the state tree. The values should be the individual reducer functions that manage that piece of the state. It will return one reducer function often called the 'root' reducer.

Note that each reducer functions will get called with every action being dispatched. If the reducer is not responsible for that action it should just hit the `default` case in the switch statement and return the unmodified state.

It might be easiest to understand `combineReducers` with an example, see the tip at the bottom as the example shows a common point of confusion.

```js

/* reducers/auth.js */
// A reducer that just deals with auth logic

export default authReducer = (state = {currentUser: null}, action) => {
  switch (action.type) {
    case 'LOGIN_USER':
      return {currentUser: action.user}
    case 'LOGOUT_USER':
      return {currentUser: null}
    default:
      return state
  }
}

/* reducers/comments.js */
// a reducer for adding and selecting comments
const initialState = {
  comments: [],
  selectedCommentId: null
};

export default commentsReducer = (state = initialState, action) => {
  switch (action.type) {
    case 'ADD_COMMENT':
      return {
        ...state,
        comments: [...state.comments, action.comment]
      }
    case 'SELECT_COMMENT':
      return {
        ...state,
        selectedCommentId: action.id
      }
    default:
      return state
  }
}

/* reducers/index.js */
// combine them together
import { combineReducers } from 'redux'
import  authReducer from './auth'
import  commentsReducer from './comments'

const rootReducer = combineReducers({
  auth: authReducer,
  comments: commentsReducer
})

export default rootReducer

/* index.js */
// use the combined reducer to create the store
import { createStore } from 'redux'
import rootReducer from './reducers'

const store = createStore(rootReducer)
// ...
```

In the above example the final shape of the state would be:

```js
{
  auth: {
    currentUser: {/* ... */},
  },
  comments: {
    comments: [{}, {}, /* ... */ ],
    selectedCommentId: /* ... */
  }
}
```

**Tip:** Notice that above, to get to the array of comments, in for example the [mapStateToProps](#mapStateToProps) function, you would have to type `state.comments.comments`. That is arguably a confusing interface for your state to have. Some possible refactors are:

1) keep the shape of the state the same and change `comments` to something like `all`

```js
// you'd make this change by changing the initialState
// and some of the logic in the commentsReducer
{
  auth: {
    currentUser: {/* ... */},
  },
  comments: {
    all: [{}, {}, /* ... */ ],
    selectedCommentId: /* ... */
  }
}
```

2) make two separate reducers

```js
// make a comments reducer
//  (in which the default state is just an array, not an object)
// make a selectedCommentId Reducer
//  (in which the default state is simply a number/null)
{
  auth: {
    currentUser: {/* ... */},
  },
  comments: [{}, {}, /* ... */ ],
  selectedCommentId: /* ... */
}
```
There's no right answer, does it make more sense for your use case that all the comments and the selected comment are stored under the same key, or should they be separate? Do what makes sense for you.

_Going Deeper: [Here is an example](https://gist.github.com/alexgriff/81dacf490e5237fc96bb4c312aeda91f) of taking deeply nested state and refactoring using `combineReducers` (as well as a pattern of calling one reducer inside of another) that drastically simplifies the logic of any single reducer._

## Redux Middlewares

#### applyMiddleware
Think of middleware as giving you the opportunity to make something happen right in between when [dispatch](#dispatch) gets called with an action, and the action hitting the [reducer](#reducer).

You can use middleware to do many things and even write your own middleware. Typically, you will use it to handle actions that depend on some async behavior such as API calls.

To add middleware, you'll supply an additional argument to [`createStore`](#createstore). You'll invoke the `applyMiddleware` function and pass it any middleware functions you are using. `applyMiddleware` can take any number of arguments

```js
import { createStore, applyMiddleware } from 'redux'
import reducer from './reducers'
import someMiddleware from 'some-middleware'
import someOtherMiddleware from 'some-other-middleware'
import reduxThunk from 'redux-thunk'

const store = createStore(
  reducer,
  applyMiddleware(someMiddleware, someOtherMiddleware, reduxThunk)
)
```

#### redux-thunk
You will probably most commonly be using the redux-thunk [middleware](#applymiddleware) to handle adding data retrieved asynchronously to your redux store.

Why would async data have to be handled differently?

Well, [reducers](#reducer) must be pure functions, meaning there can't be side-effects such as querying an API inside of a reducer.

Also, [actions](#action) must be plain objects or redux will error. An action can't be a promise and action can't be `undefined`.

Imagine a user clicks a button 'Find Pets' and you make a request to an API to retrieve data on all the pets up for adoption in their area.

Clicking the button triggers an [action creator](#action-creator) to be called. The following examples will break

```js
// X BAD X
// this action creator returns undefined
// no good, since action creators
// should return actions
const findPets = (zipCode) => {
  fetch(`http://localhost:3000/pets?zip=${zipCode}`)
  .then(res => res.json())
  .then(petData => {
    return {type: 'FIND_PETS', pets: petData}
  })
}
```

```js
// X BAD X
// this action creator returns a promise
// also no good, since action creators
// should return actions
const findPets = (zipCode) => {
  return fetch(`http://localhost:3000/pets?zip=${zipCode}`)
  .then(res => res.json())
  .then(petData => {
    return {type: 'FIND_PETS', pets: petData}
  })
}
```

The problem is you don't want to call [`dispatch`](#dispatch) until the promise has resolved and you have access to the data you need.

What thunk allows you to do is **have an action creator return a function**. In that one moment in time between when `dispatch` is called and the reducer being called, if thunk sees that your action is a function it **will not continue passing the action to the reducer. Instead, it will take that function and invoke it with `dispatch`.**

This effectively puts you in the driver's seat and gives you control of when you want `dispatch` to be called. In the case of async data that will be after the promise has resolved.

A valid action creator if using the thunk middleware:

```js
// :) GOOD :)
// this returns a function.
// thunk will see that,
// stop redux from throwing an error,
// and take that function that was supposed
// to be an action and call it
// with the dispatch function

const findPets = (zipCode) => {
  return (dispatch) => {
    fetch(`http://localhost:3000/pets?zip=${zipCode}`)
    .then(res => res.json())
    .then(petData => {
      dispatch({type: 'FIND_PETS', pets: petData})
    })
  }
}
```

Find how to configure the redux-thunk middleware in the [applyMiddleware](#applymiddleware) section. It's a separate library that you'll have to install.

_Going Deeper: One thing that's really cool about redux-thunk is that since it gives you access to dispatch directly you can call it whenever and as many times as you want. Even more than once in the same action creator. Look at this example (also, making the fetch request directly in the action creator gets messy, use the adapter pattern)_

```js
const findPets = (zipCode) => {
  return (dispatch) => {
    // this action would change the state
    // so that the user sees
    // an ajax loader or spinner
    dispatch({type: 'ASYNC_START'})

    adapter.fetchPets(zipCode)
      .then(petData => {
        dispatch({type: 'FIND_PETS', pets: petData})
      })
  }
}
```

_[A short video where I build out thunk from scratch](https://www.youtube.com/watch?v=smsOxL7mnzk&feature=youtu.be). It's basically just a conditional: If the action is a function, pass dispatch to it._


## React-Redux

Redux is a very small library that is not dependent upon being used in a React application or tied to the implementation of React in any way, though they are often used together.

The `'react-redux'` library provides an easy way to hook up your React components so they know about the Redux store as well as know to update when the Redux state changes.

If you ever forget what library a certain piece should be imported from you can ask yourself, is this things job to make React and Redux talk to each other, or is this just about Redux.

For example,
* [`connect`](#connect), literally about "connecting" React components to Redux therefore must be: `import { connect } from 'react-redux'`
* [`combineReducers`](#combinereducers), only about the way the redux state is structured, nothing about React, therefore must be: `import { combineReducers } from 'redux'`

#### Provider
The job of the `<Provider>` component is to provide the [redux store](#store) to the rest of your React components. (Without it you'd have to pass down the store as a prop to any component that needed access to it, which almost defeats the point of using Redux.)

You'll use it once at the very root of your application. Your whole app will be a child of the the `Provider`. Anything that needs to know about the store will then be able to [connect](#connect) up to it as needed. Be sure to pass the store as a prop to it.

```js
import React from 'react'
import ReactDOM from 'react-dom'
import { createStore } from 'redux'
import { Provider } from 'react-redux'
import { App } from './components/App'
import reducer from './reducers'


const store = createStore(reducer)

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('main')
)
```

_Going Deeper: The Provider makes the store accessible to components via what in React is called the 'context'.  [Context](https://reactjs.org/docs/context.html) is essentially how you could have something like a 'global variable' in React.  It's a bit more complicated than that, in addition to data being set into the context, a component that wants to know about a specific part of the context has to ask for it (using propTypes), but that's the general idea._

_It's not something you should use (basically ever unless you're writing a library) and it's still a bit of an experimental feature of React._

#### connect
Once you have the [Provider](#provider) at the top of your application you will have to connect any individual component that needs to know about Redux to the the store. Connect allows us to access important data from the Redux store (the [state](#state--state-tree) and [`dispatch`](#dispatch)) as well as wiring up the component so it knows to re-render when the redux store changes.

`connect` is a function which returns another function. That returned function should be called with a React Component.  It will return a version of that component that has all of it's normal functionality and behavior, but will also have access to additional data, the parts of the redux store you want the component to know about as well as any action creators, as props.


```js
// contrived example
import React from 'react'
import { connect } from 'react-redux'

class MyComponent extends React.Component {
  render() {
    console.log(this.props)
    // ^ would log {color: 'blue', number: 12}
    // (and any other props passed to MyComponent)
    /* ... */
  }
}

const exampleFunction = () => {
  return {
    color: 'blue',
    number: 12
  }
}

export default connect(exampleFunction)(MyComponent)
```

when `MyComponent` gets imported into another file it would have any of the props it was passed normally and additionally it would have props of `color` and `number` with the values returned from `exampleFunction`.

This is a very contrived example and doesn't show how the component gets access to the Redux store. It does demonstrate how `connect` is used to supply additional props to a component.

The `connect` function is passed one (or two) functions. Those functions return objects that will become props to the connected component.

Rather than `exampleFunction` you will typically pass one of or both of the following functions to `connect`: [`mapStateToProps`](#mapstatetoprops) & [`mapDispatchToProps`](#mapdispatchtoprops). They are discussed in much more detail below.

The typical use of `connect` will look:

```js
import React from 'react'
import { connect } from 'react-redux'

class MyComponent extends React.Component {
  render() {
    /* ... */
  }
}

const mapStateToProps = () => {
  /* more below ... */
}

const mapDispatchToProps = () => {
  /* more below ... */
}

export default connect(mapStateToProps, mapDispatchToProps)(MyComponent)
```

`mapStateToProps` is the first argument to `connect` and `mapDispatchToProps` to props is the second. That function returns a function which you then pass the React Component. That component will be connected to Redux and have extra props. Definitely kind of convoluted, but you'll get used to the pattern.

#### mapStateToProps
When using the [`connect`](#connect) function from `react-redux` you'll need to pass a callback function as the first argument. This function is typically called `mapStateToProps`, though it's not a named part of the library and you'll have to define it yourself.

Let's deconstruct the name "map state to props".  Here, "state" means the state from the Redux store; whereas "props" refers to the individual component's props (the component defined in the file you're in / that you are passing to `connect`).  The job of this function is to take the parts of the Redux state this component needs to know about, and make the data accessible to the component as a prop. In effect, mapping the redux state to the component's props.

Here's how it works: You define a function. Pass that  function to `connect` as the first argument.  **This function will be invoked with the state from the redux store.**  As an analogy, think of an event handler function. You define a callback that will get triggered on a click event (or whatever). You know that when that function is called it will be passed the event object as a first argument.
```js
button.addEventListener('click', (ev) => {
  // the callback is passed the event
  // we now have access to it
  console.log(ev.target.value)
})
```
`mapStateToProps` works similarly, you define the function and when called you know it will be passed the state as an argument.

This is how Redux exposes the state to you so that your component can use it. `mapStateToProps` should return an object. They key values pairs of this object will become the props this component has. Because this function is being called with the state, you can use whatever data from the state you'd like.

```js
class CommentsContainer extends Component {
   render() {
     console.log(this.props);
     // {
     //   comments: [...],
     //   selectedCommentId: 1
     // }
     // ...
   }
}

const mapStateToProps = (state) => {
  return {
    comments: state.comments.all,
    selectedCommentId: state.comments.selectedCommentId
  }
}

export default connect(mapStateToProps)(CommentsContainer)
```

_Going Deeper: You are not obligated to have a component's props be named the same thing as the data in the Redux store. `mapStateToProps` is where you determine what interface your component will have, i.e. what do you feel like typing all the time to access the props, and is a good place to compute a prop based off one or more pieces of the state. Some examples:_

```js
const mapStateToProps = (state) => ({
    loggedIn: !!state.auth.currentUser.id
})

const mapStateToProps = (state) => ({
    disabled: !(state.trips.origin && state.trips.destination)
})
```

#### mapDispatchToProps
`mapDispatchToProps` is the second callback function passed to [`connect`](#connect). It functions in a very similar way to [`mapStateToProps`](#mapstatetoprops).

Whereas `mapStateToProps` is a function invoked with the state from the Redux store, `mapDispatchtoProps` is a function that will be invoked with the [`dispatch` function](#dispatch) from the Redux store.

Since `dispatch` is now available to you, you can specify callback props your component will then have that will use `dispatch` to send [actions](#actions) to the [reducer](#reducer).

A simple example:

```js
import React from 'react'
import { connect } from 'react-redux'

class Counter extends React.Component {

  render() {
    return (
      <div>
        <h1>{this.props.count}</h1>
        <button
          onClick={this.props.increment} >
          +
        </button>
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
  count: state.count
})

const mapDispatchToProps = (dispatch) => ({
  increment: () => dispatch({type: 'INCREMENT'})
})

export default connect(mapStateToProps, mapDispatchToProps)(Counter)
```

`mapDispatchToProps` returns an object. The key(s) of that object will become the name of the component's props. The value(s) will be **a function which, when invoked, will call `dispatch` with an action.**

Then `dispatch` calls the reducer with the action, the state gets updated, our component is connected to Redux so it knows to re-render when the Redux state changes and display the new state (which it has access to as props via `mapStateToProps`)

_Going Deeper: The signature of `mapDispatchToProps` is a bit weird, it returns an object where the values are functions that, when invoked, invoke the `dispatch` function with an action. Throw in action creators and it becomes even more convoluted, an object with values that are functions that invoke the `dispatch` function with the return value of an action creator function._

_There's a simpler shorthand syntax to alleviate this complexity. Instead of a function you can pass an object as the second argument to `connect`. The keys become props, and the values should be action creator functions. `dispatch` will get called with the return value of those functions automatically. The code below is identical in behavior to the code above_

```js
import React from 'react'
import { connect } from 'react-redux'

class Counter extends React.Component {

  render() {
    return (
      <div>
        <h1>{this.props.count}</h1>
        <button
          onClick={this.props.increment} >
          +
        </button>
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
  count: state.count
})

export default connect(mapStateToProps, {increment: () => ({type: 'INCREMENT'})(Counter)
```

_Typically this is handy because you will be importing your action creators from another file in exactly this format:_

```js
import React from 'react'
import { connect } from 'react-redux'
import * as actions from './actions'

class Counter extends React.Component {

  render() {
    return (
      <div>
        <h1>{this.props.count}</h1>
        <button
          onClick={this.props.increment} >
          +
        </button>
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
  count: state.count
})

export default connect(mapStateToProps, actions)(Counter)
```

_Going Deeper: A few more things to point out about `mapDispatchToProps`. First, if you don't pass any second argument to `connect`, then by default, `connect` gives you the `dispatch` function as a prop. This is valid code:

```js
import React from 'react'
import { connect } from 'react-redux'

class Counter extends React.Component {

  render() {
    return (
      <div>
        <h1>{this.props.count}</h1>
        <button
          onClick={ () => this.props.dispatch({type: 'INCREMENT'}) } >
          +
        </button>
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
  count: state.count
})

export default connect(mapStateToProps)(Counter)
```
_This is interesting because it gives you a lot of flexibility to manually use `this.props.dispatch`, but honestly you will normally be working on a higher level of abstraction than this._ 

_Secondly, what should you do if a component only needs to use `mapDispatchToProps` and not `mapStateToProps`. In that case, `mapDispatchToProps` still needs to be the second argument. Developers will typically use `null` as the first argument to indicate, 'hey, this component doesn't have any props coming from the state'_

```js
export default connect(null, actions)(SomeComponent)
```