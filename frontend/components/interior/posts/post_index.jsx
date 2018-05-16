import React, { Component } from 'react'
import PostIndexItem from './post_index_item'
import isEqual from 'lodash/isEqual'

export default class PostIndex extends Component {


  componentDidMount(){
    this.props.fetchPosts(this.props.match.params.userId)
  }

  componentWillReceiveProps(newProps){
    if (this.props.news){
      const oldKeys = this.props.posts.map((post) => (post.id))
      const newKeys = newProps.posts.map((post) => (post.id))
      if (!isEqual(oldKeys.sort(), newKeys.sort())) {
        this.props.fetchPosts()
      }
    }else{
      if (this.props.match.params.userId != newProps.match.params.userId){
        this.props.fetchPosts(newProps.match.params.userId)
      }
    }
  }

  render(){
    let posts = "NO POSTS YET"
      if (this.props.posts.length > 0) {
        posts = this.props.posts.map( (post, idx) => (<PostIndexItem post={post} key={idx} poster={this.props.users[post.author_id]} />) )
      }

    return (
      <section className='postIndexContainer'>
        {posts}
      </section>
    )
  }
}
