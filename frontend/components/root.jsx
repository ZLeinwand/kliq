import React from 'react'
import { Provider } from 'react-redux'
import { HashRouter } from 'react-router-dom'
import App from './app'


const Root = ({store}) => {
  return (
    <div>
      <Provider store={store} >
        <HashRouter>
          <App />
        </HashRouter>
      </Provider>
    </div>
  )
}

export default Root;
