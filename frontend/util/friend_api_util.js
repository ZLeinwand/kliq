export const makeFriendRequest = (friendId) => {
  return $.ajax({
    method: 'POST',
    url: `/api/users/${friendId}/friendships`,
    data: { friend: { friendee: friendId } }
  })
}

export const updateFriendshipStatus = (friendee) => {
  return $.ajax({
    method: 'PATCH',
    url: `/api/users/${friendee.friendee}/friendships`,
    data: { friend: friendee }
  })
}

export const destroyFriendship = (friendId) => {
  return $.ajax({
    method: 'DELETE',
    url: `/api/users/${friendId}/friendships`
  })
}

export const fetchFriends = (userId) => {
  return $.ajax({
    url: `/api/users/${userId}/friendships`
  })
}

export const fetchFriendRequests = () => {
  return $.ajax({
    url: '/api/users/requests'
  })
}
