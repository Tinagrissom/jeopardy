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
        (response) => this.setState({
          questions: response.data,
          question: '',
          points: '',
          category: '',
          answer: ''
        }),
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
        <div className="game-board">
            <div className="categories">
              {this.state.questions.map((category, i) => {
                if (i === 0) {
                return (
                  <h2>{category.category}</h2>
                )
              }
              })}
            </div>

        {this.state.questions.map((question) => {
          return (
            <div className="questions">
              <h2>${question.points}</h2>
            </div>

          )
        })}
      < /div>
      </div>
    )
  }
}

export default App
