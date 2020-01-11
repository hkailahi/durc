module Durc.API.Types where

import BasicPrelude

import Data.Time (UTCTime)

----------------------------------------------------------------------------
-- Durc Primitives

newtype URL = URL { unURL :: Text } deriving (Show, Eq)

----------------------------------------------------------------------------
-- User

newtype Email = Email { unEmail :: Text } deriving (Show, Eq)
newtype Token = Token { unToken :: Text } deriving (Show, Eq)
newtype Username = Username { unUsername :: Text } deriving (Show, Eq)
newtype Bio = Bio { unBio :: Text } deriving (Show, Eq)
newtype Image = Image { unImage :: URL } deriving (Show, Eq)

data User = User
  { _userEmail    :: Email
  , _userToken    :: Token
  , _userUsername :: Username
  , _userBio      :: Bio
  , _userImage    :: Image
  } deriving (Show, Eq)

----------------------------------------------------------------------------
-- Profile

data Profile = Profile
  { _profileUsername  :: Username
  , _profileBio       :: Bio
  , _profileImage     :: URL
  , _profileFollowing :: Bool
  } deriving (Show, Eq)

----------------------------------------------------------------------------
-- Article(s)

newtype Slug = Slug { unSlug :: Text } deriving (Show, Eq)
newtype Title = Title { unTitle :: Text } deriving (Show, Eq)
newtype Description = Description { unDescription :: Text } deriving (Show, Eq)
newtype Body = Body { unBody :: Text } deriving (Show, Eq)
newtype TagList = TagList { unTagList :: Text } deriving (Show, Eq)
newtype Favorited = Favorited { unFavorited :: Text } deriving (Show, Eq)
newtype FavoritesCount = FavoritesCount { unFavoritesCount :: Text } deriving (Show, Eq)

newtype Author = Author { unAuthor :: Profile } deriving (Show, Eq)

data Article = Article
  { _articleSlug           :: Slug
  , _articleTitle          :: Title
  , _articleDescription    :: Description
  , _articleBody           :: Body
  , _articleTagList        :: TagList
  , _articleCreatedAt      :: UTCTime
  , _articleUpdatedAt      :: UTCTime
  , _articleFavorited      :: Favorited
  , _articleFavoritesCount :: FavoritesCount
  , _articleAuthor         :: Author
  } deriving (Show, Eq)

data Articles = Articles
  { _articlesArticles :: [Article]
  } deriving (Show, Eq)

----------------------------------------------------------------------------
-- Comment(s)

newtype CommentId = CommentId { unCommentId :: Int } deriving (Show, Eq, Ord)

data Comment = Comment
  { _commentId        :: CommentId
  , _commentCreatedAt :: UTCTime
  , _commentUpdatedAt :: UTCTime
  , _commentBody      :: Body
  , _commentAuthor    :: Author
  } deriving (Show, Eq)

data Comments = Comments
  { _commentsComments :: [Comment]
  } deriving (Show, Eq)

----------------------------------------------------------------------------
-- Tags

newtype Tag = Tag { unTag :: Text } deriving (Show, Eq)

data Tags = Tags
  { _tagsTags :: [Tag]
  } deriving (Show, Eq)

----------------------------------------------------------------------------
-- Tags

data ErrorCode =
    Err401 -- ^Unauthorized requests, when a request requires authentication but it isn't provided
  | Err403 -- ^Forbidden requests, when a request may be valid but the user doesn't have permissions to perform the action
  | Err404 -- ^Not found requests, when a resource can't be found to fulfill the request
  deriving (Show, Eq)

data Error = Error
  { _errorBody :: Text
  } deriving (Show, Eq)
