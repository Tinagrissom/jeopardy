import React, { Component } from 'react'
import axios from 'axios'

class App extends Component {

  state = {
    questions: [],
  }

  render = () => {
    return (
      <div>
        <h1>Jeopardy</h1>
      </div>
    )
  }
}

export default App
