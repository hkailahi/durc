module Durc.API where

import BasicPrelude

import Servant

import Durc.Api.Types

-- https://github.com/gothinkster/realworld/tree/master/api#authentication
-- POST /api/users/login
data PostUserLogin = PostUserLogin
  { email    :: Email
  , password :: Password
  } deriving (Show, Eq)
type UsersLoginApi = "users" :> "login" :> ReqBody '[JSON] User :> Post '[JSON] User

-- https://github.com/gothinkster/realworld/tree/master/api#registration
-- POST /api/users
type UsersApi = "users" :> ReqBody '[JSON] User :> Post '[JSON] User

-- https://github.com/gothinkster/realworld/tree/master/api#get-current-user
-- GET /api/user
type UserApi = "user" :> Get '[JSON] User

-- https://github.com/gothinkster/realworld/tree/master/api#update-user
-- PUT /api/user