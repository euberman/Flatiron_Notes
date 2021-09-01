/* *******************************************************************************************
* REACT.JS CHEATSHEET
* ******************************************************************************************* */


/* *******************************************************************************************
* Base Component
* ******************************************************************************************* */
	// ---------------------------------------------------------
	// Class Component
import React, { Component } from 'react';
class X extends Component {
	constructor(props) {
		super() 
		this.state = { }
	}
	render() {
		return (
			<div></div>
		)
	}
}
export default X;
	// ---------------------------------------------------------
	// Functional Component
		import React from 'react';
		function Y(props)  {
			return (
				<div></div>
			)
		}
		export default Y;

		import React from 'react';
		const Z = (props) => {
			return (
				<div></div>
			)
		}
		export default Z;


/* *******************************************************************************************
* Form Event Handlers
* ******************************************************************************************* */

		handleClick = () => {
			this.setState(previousState => {
			  return {
			    count: previousState.count + 1
			  }
			})
		}

	
	// Update state from all Form data changes with one method
		valueChange = (e) => {
		    this.setState({
		    [e.target.name]: e.target.value
		    })
		}

		const {myFirstState, mySecondState} = this.state;
		<>
			<input placeholder="insertValue" name="myFirstState" 
				value={myFirstState}
				onChange= {this.valueChange} />

			<input placeholder="insertValue" name="mySecondState" 
				value={mySecondState}
				onChange= {this.valueChange}/>
		</>
	// 	_____________________________________________________________________________________
	// 	Controlled Form Example:
	
		class PokemonForm extends React.Component {
			initialState = { name: '', hp: '', front: '', back: '' }
			state = initialState
			
			handleInputChange = (e) => {
				this.setState({ [e.target.name]: e.target.value })
			}

			handleSubmit = (e) => {
				e.preventDefault()
				const newPokemon = {
				    name: this.state.name,
				    hp: this.state.hp,
				    sprites: { front: this.state.front, back: this.state.back }
				}
				this.props.addPokemon(newPokemon)
				this.setState(this.initialState)
			}

			render() {
				return (
				    <div>
					    <h3>Add a Pokemon!</h3>
					    <Form onSubmit={() => {this.props.handleSubmit(this.state)}}>
					      <Form.Group widths="equal">
					        <Form.Input fluid label="Name" placeholder="Name" 
					              name="name"
					              value= {this.state.name}
					              onChange={this.handleInputChange} />
					        <Form.Input fluid label="hp" placeholder="hp" 
					              name="hp"
					              value= {this.state.hp}
					              onChange={this.handleInputChange}/>
					        <Form.Input fluid label="Front Image URL" placeholder="url" 
					              name="frontUrl" 
					              value= {this.state.front}
					              onChange={this.handleInputChange} />
					        <Form.Input fluid label="Back Image URL" placeholder="url" 
					              name="backUrl" 
					              value= {this.state.back}
					              onChange={this.handleInputChange}/>
					      </Form.Group>
					      <Form.Button>Submit</Form.Button>
					    </Form>
				    </div>
				)
			}
		}
		export default PokemonForm;
/* ============================================================================================= 
*  Dynamic Components App Example
*  ============================================================================================= */
	// 	_____________________________________________________________________________________
	// 	App.js 
			import React, { Component } from 'react';
			import BlogPost from './BlogPost.js'
			import ColorBox from './ColorBox.js'

			class App extends Component {
			  render() {
			    return (
			      <div id="app">
			          <BlogPost />
			          <div id="seperator"></div>
			          <div className="wrapper">
			            <ColorBox opacity={1} /> /* opacity prop is initially passing to ColorBox */
			          </div>
			      </div>
			    )
			  }
			}
			export default App;
	// 	_____________________________________________________________________________________
	// 	Comment.js 
			import React from 'react';

			class Comment extends React.Component {
			  constructor(props) {
			    super() 
			    this.state = {}
			  }
			  render() {
			    return (
			      <div className='comment'>
			        {this.props.commentText}
			      </div>
			    )
			  }
			}
			export default Comment;
	// 	_____________________________________________________________________________________
	// 	BlogPost.js 
			import React, { Component } from 'react';
			import Comment from './Comment'

			export default class BlogPost extends Component {
			  	render() {
				    const comments = [
				      "When we speak we are afraid our words will not be heard or welcomed.  - Audrey Lorde", 
				      "I am no longer accepting the things I cannot change. - Angela Davis",
				      "If you don't understand, ask questions. - Chimamanda Ngozi Adichie"
				    ]
				    return (
				      <div id="blog-post" className="wrapper">
				        Just like moons and like suns,<br/> With the certainty of tides,<br/> Just like hopes springing high,<br/> Still I will rise.<br/> -Maya Angelou<br/>
				        <Comment commentText={comments[0]} />
				        <Comment commentText={comments[1]} />
				        <Comment commentText={comments[2]} />  
				      </div>
					)
				}
			}

	// 	_____________________________________________________________________________________
	// 	ColorBox.js 
			import React, { Component } from 'react';

			export default class ColorBox extends Component {
			  render() {
			    if(this.props.opacity >= 0.2) {
			      return (
			        <div className="color-box" style={{opacity: this.props.opacity}}>
			          <ColorBox opacity={this.props.opacity - 0.1} />
			        </div>
			      )
			    } else {
			      return null
			    }
			  }
			}
			// 	_____________________________________________________________________________________
			// Alternative solution 1:
			export default class ColorBox extends Component {
			  render() {
			    return (
			      <div className="color-box" style={{opacity: this.props.opacity}}>
			        {this.props.opacity >= 0.2 ? <ColorBox opacity={this.props.opacity - 0.1} /> : null}
			      </div>
			    )
			  }
			}
			// 	_____________________________________________________________________________________
			// Alternative solution 2:
			export default class Example extends Component {
			  render() {
			    const newValue = this.props.value * 2;
			    return this.props.value > 100 ? null : ( <div>
			        <Example value={newValue} />
			      </div>)
			  }
			}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*  Dynamic Components
*  --------------------------------------------------------------------------------------------- */


