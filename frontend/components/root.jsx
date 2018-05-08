import React from 'react'
import { Provider } from 'react-redux'
import { HashRouter } from 'react-router-dom'


const Root = ({store}) => {
  return (
    <div>
      <Provider store={store} >
        <h1>ROOTBOI</h1>
      </Provider>
    </div>
  )
}

export default Root;