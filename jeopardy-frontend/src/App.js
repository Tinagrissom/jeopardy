import React, { Component } from 'react'
import axios from 'axios'
import Question from './Question'

class App extends Component {

  state = {
    question: '',
    points: '',
    category: '',
    answer: '',
    reveal: false,
    show: false,
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

  revealCategories = () => {
    this.setState({
      reveal: true,
    })
  }

  showQuestion = ({currentTarget}) => {
    this.setState({
      show: true,
    })
  }

  componentDidMount = () => {
    this.getQuestions()
  }

  render = () => {
    return (
      <div>
      {/* HEADER */}

        <div id="title">
            <button type="button" id="open" onClick={this.revealCategories}>
            LET'S PLAY
            </button>
        </div>

        {/* GAMEBOARD */}
        <div className="game-board">

          {/* REVEAL CATEGORIES */}
              <div>
                {this.state.reveal === true ?
                  <div className="categories" style={{
                    backgroundColor:"#060DE3",
                    margin:"0",
                    backgroundSize:"cover",
                  }}>
                    {this.state.questions.map((category, i) => {
                        if (i === 0) {
                        return (
                          <h2>{category.category}</h2>
                        )
                      }
                  })}
              </div>
            : <div
                className="categories"
                style={{
                  backgroundImage: "url(https://www.newscaststudio.com/wp-content/uploads/2019/09/jeopardy-season-36-open.jpg)",
                  backgroundPosition: "center",
                  backgroundRepeat: "no-repeat",
                  backgroundSize: "cover",
                  }}>
              </div> }
            </div>

        {/* LOADING THE QUESTIONS */}
        {this.state.questions.map((question) => {
          return (
            <div className="questions">
                <a type="button" onClick={this.showQuestion}>
                  {this.state.show === true ?
                      <div>
                        <h2>{question.question}</h2>

                      </div>
                :
                  <div>
                    <h2>${question.points}</h2>
                    <Question />
                  </div>
                }
                </a>
                </div>

                )
              })}
            </div>

      </div>
    )
  }
}

export default App
