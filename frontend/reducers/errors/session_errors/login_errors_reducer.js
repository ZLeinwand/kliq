import { RECEIVE_LOGIN_ERRORS } from '../../../actions/session_actions'

export default (oldState = [], action) => {
  switch (action.type) {
    case RECEIVE_LOGIN_ERRORS:
      return action.errors
    default:
      return []
  }
}
