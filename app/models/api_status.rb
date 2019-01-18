class APIStatus
  SUCCESS                = { status: 'Success', status_code: 1000 }
  FAILURE                = { status: 'Failure', status_code: 1001 }
  AUTHENTICATION_FAILURE = { status: 'Authentication failure', status_code: 1003 }
  USER_UNAUTHENTICATED   = { status: 'User unauthenticated', status_code: 1004 }
  USER_UNAUTHORIZED      = { status: 'User unauthorized', status_code: 1005, message: 'User is not authorized'}
end
