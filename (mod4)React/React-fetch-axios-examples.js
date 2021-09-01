// ***********************************************************************************
// https://www.npmjs.com/package/axios#example   
// ***********************************************************************************
    // Make a request for a user with a given ID ----------
        axios.get('/user?ID=12345')
          .then(function (response) {
            // handle success
            console.log(response);
          })
          .catch(function (error) {
            // handle error
            console.log(error);
          })
          .then(function () {
            // always executed
          });

    // Optionally the request above could also be done as ----------
        axios.get('/user', {
            params: {
              ID: 12345
            }
          })
          .then(function (response) {
            console.log(response);
          })
          .catch(function (error) {
            console.log(error);
          })
          .then(function () {
            // always executed
          });  

    // Want to use async/await? Add the `async` keyword to your outer function/method. ----------
        async function getUser() {
          try {
            const response = await axios.get('/user?ID=12345');
            console.log(response);
          } catch (error) {
            console.error(error);
          }
        }
        
    // Performing a POST request ----------
        axios.post('/user', {
            firstName: 'Fred',
            lastName: 'Flintstone'
          })
          .then(function (response) {
            console.log(response);
          })
          .catch(function (error) {
            console.log(error);
          });

    // Performing multiple concurrent requests ----------
        function getUserAccount() {
          return axios.get('/user/12345');
        }

        function getUserPermissions() {
          return axios.get('/user/12345/permissions');
        }

        Promise.all([getUserAccount(), getUserPermissions()])
          .then(function (results) {
            const acct = results[0];
            const perm = results[1];
          });
// ***********************************************************************************
//      
// ***********************************************************************************
    getUsers = async () => {
        let res = await axios.get("https://reqres.in/api/users?page=1");
        let { data } = res.data;
        this.setState({ users: data });
    };
    axios.post('https://yourdomain.com', { name: 'Aditya' })
// ***********************************************************************************
//      
// ***********************************************************************************
    import axios from 'axios';
    export default axios.create({
      baseURL: `http://jsonplaceholder.typicode.com/`
    });
    // -------------------- Using a Base Instance in Axios
    import React from 'react';
    import axios from 'axios';
    import API from '../api';

    export default class PersonList extends React.Component {
      handleSubmit = event => {
        event.preventDefault();

        API.delete(`users/${this.state.id}`)
          .then(res => {
            console.log(res);
            console.log(res.data);
          })
      }
    }
    // -------------------- Using async and await
    handleSubmit = async event => {
      event.preventDefault();

      //
      const response = await API.delete(`users/${this.state.id}`);

      console.log(response);
      console.log(response.data);
    };
 

// ***********************************************************************************
//      
// ***********************************************************************************

// ***********************************************************************************
//      
// ***********************************************************************************
    async function asyncFunc() {
      try {
        // fetch data from a url endpoint
        const data = await axios.get("/some_url_endpoint");
        return data;
      } catch(error) {
        console.log("error", error);
        // appropriately handle the error
      }
    }
// ***********************************************************************************
//      https://www.educative.io/edpresso/how-to-make-an-axios-post-request
// ***********************************************************************************
    axios.post('https:sample-endpoint.com/user', order)
      .then(function (response) {
        console.log(response);
      })
    const res = await axios.post('https:sample-endpoint.com/data')

// ***********************************************************************************
//      https://www.educative.io/edpresso/how-to-make-an-axios-post-request
// ***********************************************************************************
    
    import axios from "axios";

    try {
      const response = await axios.post('http://demo0725191.mockable.io/post_data', { posted_data: 'example' });
      console.log('👉 Returned data:', response);
    } catch (e) {
      console.log(`😱 Axios request failed: ${e}`);
    }


// ***********************************************************************************
//      
// ***********************************************************************************

    export function fetchArticleDetails() {
      return async function(dispatch) {
        const { data } = await axios.get("https://api.myjson.com/bins/19dtxc");
        dispatch(setArticleDetails(data));
      };
    }

    export function fetchUserProfile() {
      return async function(dispatch) {
        const { data } = await axios.get("https://api.myjson.com/bins/19dtxc");
        dispatch(setUserProfile(data));
      };
    }

    export function recommendArticle (id,  amountOfRecommends) {
      return  function (dispatch) {
        return axios.post("https://api.myjson.com/bins/19dtxc, {
           amountOfRecommends
      });
    })

// ***********************************************************************************
//      
// ***********************************************************************************

// ***********************************************************************************
//      
// ***********************************************************************************

// ***********************************************************************************
//      
// ***********************************************************************************

// ***********************************************************************************
//      
// ***********************************************************************************

// ***********************************************************************************
//      
// ***********************************************************************************

// ***********************************************************************************
//      
// ***********************************************************************************

// ***********************************************************************************
//      
// ***********************************************************************************