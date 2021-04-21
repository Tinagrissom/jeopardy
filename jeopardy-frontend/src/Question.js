import React, { Component } from 'react'

export default class Question extends Component {
  state = {
    on: false
  }

  toggle = () => {
    this.setState({
      on: true
    })
  }

  render() {
    return (
      <div>
        {this.state.on && (
          <h1>Hello</h1>
        )}
          <button onClick={this.toggle}>Show</button>
      </div>
    )
  }
}
