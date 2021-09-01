React-Hooks.js

import React, {useRef, useEffect} from "react";

export default function (props) {
  // Initialized a hook to hold the reference to the title div.
  const titleRef = useRef();
  
  useEffect(function () {
    setTimeout(() => {
      titleRef.current.textContent = "Updated Text"
    }, 2000); // Update the content of the element after 2seconds 
  }, []);
  
  return <div className="container">
    {/** The reference to the element happens here **/ }
    <div className="title" ref={titleRef}>Original title</div>
  </div>
}