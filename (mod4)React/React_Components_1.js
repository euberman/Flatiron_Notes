
/* ============================================================================================= 
*  Dynamic Components Examples
*  ============================================================================================= */

// 	_____________________________________________________________________________________

		function tick() {
		  const element = (
		    <div>
		      <h2>It is {new Date().toLocaleTimeString()}.</h2>
		    </div>
		  );
		  // highlight-next-line
		  ReactDOM.render(element, document.getElementById('root'));
		}

		setInterval(tick, 1000);

// 	_____________________________________________________________________________________
//  Setting Default Prop values
		Component.defaultProps = {
		  values: (() => {
		    const defRow = ['#F00', '#F00', '#F00', '#F00', '#F00', '#F00', '#F00', '#F00', '#F00', '#F00']
		    return (new Array(10).fill(defRow))
		  })()
		}

// 	_____________________________________________________________________________________
//  Element to display date
		<FormattedDate date={this.state.date} />

		function FormattedDate(props) {
		  return <h2>It is {props.date.toLocaleTimeString()}.</h2>;
		}

// 	_____________________________________________________________________________________
//	Correct way to fetch data and update State values
		constructor(props) {
		    super(props);
		    this.state = {
		      posts: [],
		      comments: []
		    };
		}

		// shallowly merges data seperately for posts and comments through independent setState() calls
		  componentDidMount() {
		    fetchPosts().then(response => {
		      this.setState({
		        posts: response.posts
		      });
		    });

		    fetchComments().then(response => {
		      this.setState({
		        comments: response.comments
		      });
		    });
		  }
// 	_____________________________________________________________________________________
//  3 Ways to setState() on Component

		/*	Option 1 ~~~~~ */
			this.setState({comment: 'Hello'});

		/*	Option 2 ~~~~~ */
			this.setState((state, props) => ({
			    counter: state.counter + props.increment
			}));

		/* Option 2 ~~~~~ */
			this.setState(function(state, props) {
			    return {
			    	counter: state.counter + props.increment
			    };
			});
// 	_____________________________________________________________________________________
		componentDidMount() {
		    fetch('http://localhost:3000/pokemon')
		    .then(res => res.json())
		    .then(items => this.setState({ pCollection: items }))
		  }

		  addPokemon = (newPokemon) => {
		    fetch('http://localhost:3000/pokemon',{
		      method: 'POST',
		      headers: {'Content-type':'application/json'},
		      body: JSON.stringify(newPokemon)
		    })
		    const updatedPokemons = [...this.state.pCollection, newPokemon]
		    this.setState({pCollection: updatedPokemons})
		  }
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
// 	_____________________________________________________________________________________
