enum IsFollowing { yes, no, me }

bool isMine(IsFollowing value) {
  if (value == IsFollowing.me) {
    return true;
  } else {
    return false;
  }
}

bool intoBool(IsFollowing value) {
  if (value == IsFollowing.yes) {
    return true;
  } else {
    return false;
  }
}
