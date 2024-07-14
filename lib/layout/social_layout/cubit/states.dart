abstract class SocialStates{}

class SocialInitialState extends SocialStates{}

class SocialGetUserSuccessState extends SocialStates{}
class SocialGetUserLoadingState extends SocialStates{}
class SocialGetUserErrorState extends SocialStates
{
  final String error;
  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates{}
class SocialNewPostState extends SocialStates{}

class SocialProfileImageSuccessState extends SocialStates{}
class SocialProfileImageErrorState extends SocialStates{}
class SocialCoverImageSuccessState extends SocialStates{}
class SocialCoverImageErrorState extends SocialStates{}
class SocialPostImageSuccessState extends SocialStates{}
class SocialPostImageErrorState extends SocialStates{}

class SocialUploadProfileImageSuccessState extends SocialStates{}
class SocialUploadProfileImageErrorState extends SocialStates{}
class SocialUploadCoverImageSuccessState extends SocialStates{}
class SocialUploadCoverImageErrorState extends SocialStates{}
class SocialUserUploadErrorState extends SocialStates{}
class SocialUserUploadLoadingState extends SocialStates{}

//Create Post
class SocialCreatePostLoadingState extends SocialStates{}
class SocialCreatePostErrorState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}
class SocialRemovePostImageState extends SocialStates{}
