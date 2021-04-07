import React, { Component } from 'react'
import axios from 'axios'

class App extends Component {

  state = {
    question: '',
    points: '',
    category: '',
    answer: '',
    questions: [],
  }

  getQuestions = () => {
    axios
      .get('/questions')
      .then(
        (response) => this.setState({questions: response.data, question: '', points: '', category: '', answer: ''}),
      )
      .catch((error) => console.error(error))
  }

  componentDidMount = () => {
    this.getQuestions()
  }

  render = () => {
    return (
      <div>
        <h1>Jeopardy</h1>
        {this.state.questions.map((question) => {
          return (
          <h2>{question.question}</h2>
        )
        })}

      </div>
    )
  }
}

export default App
