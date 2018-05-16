import React, { Component } from 'react'
import FriendsListItem from './friends_list_item'


export default class FriendIndex extends Component {

  componentDidMount() {
    this.props.fetchFriends(this.props.match.params.userId)
  }



  render () {
    // debugger
    let friends = []
    if (this.props.friends){
      for (let i = 0; i < this.props.friends.length; i++){
        let friend = this.props.friends[i]
        if (typeof friend === 'undefined' || friend.id === this.props.currentUserId){
          continue;
        }else{
          friends.push((<FriendsListItem friend={friend} key={i} />))
        }
      }
    }
    return (
      <section className='friendIndexContainer'>
        {friends}
      </section>
    )
  }
}
