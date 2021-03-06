import { signup } from '../../../actions/session_actions'
import { connect } from 'react-redux'
import SessionForm from './signup_session_form'

const mapStateToProps = (state, ownProps) => {
  return {
    formType: 'Sign Up',
    errors: state.errors.session.signupErrors
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    action: (userInfo) => dispatch(signup(userInfo))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm)
