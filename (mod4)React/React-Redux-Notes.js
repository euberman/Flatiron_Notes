
// ***********************************************************************************
// REDUX-THUNK
// ***********************************************************************************
  // thunk.withExtraArguments
  const store = createStore(
    reducer,
    applyMiddleware(thunk.withExtraArgument({ api, whatever }))
  )
  // later
  function fetchUser(id) {
    return (dispatch, getState, { api, whatever }) => {
      // you can use api and something else here
    }
  }
// ----------------------------------------------------------------------
// Conditional dispatches
  function incrementIfOdd() {
    return (dispatch, getState) => {
      const { counter } = getState();
  
      if (counter % 2 === 0) {
        return;
      }
  
      dispatch(increment());
    };
  }
// ----------------------------------------------------------------------
// Async Request
  const INCREMENT_COUNTER = 'INCREMENT_COUNTER';
  
  function increment() {
    return {
      type: INCREMENT_COUNTER
    };
  }
  
  function incrementAsync() {
    return dispatch => {
      setTimeout(() => {
        // Yay! Can invoke sync or async actions with `dispatch`
        dispatch(increment());
      }, 1000);
    };
  }
// ----------------------------------------------------------------------
// General Async Request
  function resolveAfter2Seconds(x) {
    return new Promise(resolve => {
      setTimeout(() => {
        resolve(x);
      }, 2000);
    });
  };
  const add = async function(x) { // async function expression assigned to a variable
    let a = await resolveAfter2Seconds(20);
    let b = await resolveAfter2Seconds(30);
    return x + a + b;
  };
  add(10).then(v => {
    console.log(v);  // prints 60 after 4 seconds.
  });
  
  (async function(x) { // async function expression used as an IIFE
    let p_a = resolveAfter2Seconds(20);
    let p_b = resolveAfter2Seconds(30);
    return x + await p_a + await p_b;
  })(10).then(v => {
    console.log(v);  // prints 60 after 2 seconds.
  });
// ----------------------------------------------------------------------
// Using conditional rendering to prevent item.map from throwing error
  <div className="container">
    {this.state.posts && this.state.posts.length !== 0 ?
        this.state.posts.map((post, index) => {
            const { title, content } = post;
            return <Card title={title}>{content}</Card>;
        }) :
    <Loading/>}
  </div>
// ----------------------------------------------------------------------
componentDidMount() {
// POST request using axios with error handling
const article = { title: 'React POST Request Example' };
axios.post('https://reqres.in/invalid-url', article)
  .then(response => this.setState({ articleId: response.data.id }))
  .catch(error => {
      this.setState({ errorMessage: error.message });
      console.error('There was an error!', error);
  });
}
// ----------------------------------------------------------------------
// *********************************************************************
//   ASYNC
// *********************************************************************
// ASYNC USERS REQUEST
const getUsers = async () => {
  const response = await fetch("https://jsonplaceholder.typicode.com/users");
  const users = await response.json();
  return users;
};
// ASYNC POSTS REQUEST
const getPosts = async () => {
  const response = await fetch("https://jsonplaceholder.typicode.com/posts");
  const posts = await response.json();
  return posts;
};
// ASYNC POST UPDATE
const updatePost = async newPost => {
  console.log("ATTEMPTING TO UPDATE POST WITH DATA: ", newPost);

  // IF WE WERE TO UPDATE THE FAKE API
  const response = await fetch("https://jsonplaceholder.typicode.com/posts", {
    method: "POST",
    body: JSON.stringify({
      title: newPost.title,
      body: newPost.body,
      userId: newPost.userId
    }),
    headers: {
      "Content-type": "application/json; charset=UTF-8"
    }
  });
  const updatedPosts = await response.json();
  return updatedPosts;
};

// *********************************************************************
// HOOKS - useState()
// *********************************************************************
import React, { useState } from 'react';

  const Example = () => {
    const [count, setCount] = useState(0);

    const handleOrangeClick = () => {
      // Similar to this.setState({ fruit: 'orange' })
      setFruit('orange');
    }

    return (
      <div>
        <p>You clicked {count} times</p>  {/* READING STATE */}
        <button onClick={() => setCount(count + 1)}> Click me </button> {/* UPDATING STATE */}
      </div>
    );
}

// *********************************************************************
// HOOKS - useEffect()
// think of useEffect Hook as componentDidMount, componentDidUpdate, and componentWillUnmount combined.
// *********************************************************************

// Similar to componentDidMount and componentDidUpdate:
useEffect(() => {
  // Update the document title using the browser API
  document.title = `You clicked ${count} times`;
});

handleChange = (e) => {
  this.setState({ [e.target.name] : e.target.value });
}
// ***********************************************************************************
// REACT REDUX
// ***********************************************************************************
  // Prodive Store
      import React from 'react'
      import ReactDOM from 'react-dom'
      import TodoApp from './TodoApp'

      import { Provider } from 'react-redux'
      import store from './redux/store'

      const rootElement = document.getElementById('root')
      ReactDOM.render(
        <Provider store={store}>
          <TodoApp />
        </Provider>,
        rootElement
      )
// ----------------------------------------------------------------------
  // CONNECT()
      const mapStateToProps = (state, ownProps) => ({
        // ... computed data from state and optionally ownProps
      })
      const mapDispatchToProps = {
        // ... normally is an object full of action creators
      }
      // We normally do both in one step, like this:
      connect(mapStateToProps,mapDispatchToProps)(Component)

// ----------------------------------------------------------------------
  // redux/actions.js
      import { ADD_TODO } from './actionTypes'
      let nextTodoId = 0
      export const addTodo = content => ({
        type: ADD_TODO,
        payload: {
          id: ++nextTodoId,
          content
        }
      })

      // ... other actions
// ----------------------------------------------------------------------
// components/AddTodo.js
      import React from 'react'
      import { connect } from 'react-redux'
      import { addTodo } from '../redux/actions'
      
      class AddTodo extends React.Component {
        // ...
        handleAddTodo = () => {
          // dispatches actions to add todo
          this.props.addTodo(this.state.input)
          // sets state back to empty string
          this.setState({ input: '' })
        }
        render() {
          return (
            <div>
              <input
                onChange={e => this.updateInput(e.target.value)}
                value={this.state.input}
              />
              <button className="add-todo" onClick={this.handleAddTodo}>
                Add Todo
              </button>
            </div>
          )
        }
      }
      
      export default connect(
        null,
        { addTodo }
      )(AddTodo)

// ***********************************************************************************
// PROP-TYPES
// ***********************************************************************************
      import PropTypes from 'prop-types'

      function HelloWorldComponent({ name }) {
        return (
          <div>Hello, {name}</div>
        )
      }

      HelloWorldComponent.propTypes = {
        name: PropTypes.string
      }

      export default HelloWorldComponent

x
// ----------------------------------------------------------------------
// ----------------------------------------------------------------------
// ----------------------------------------------------------------------