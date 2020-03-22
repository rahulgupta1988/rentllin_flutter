class User {
  int user_id;
  int user_role;
  String username;
  String email;
  int contact_id;
  String profile_image;
  int last_location_id;
  String last_login_date;
  int isRemember;
  int staylogin;
  String userkey;
  String client_name;

  User(
      this.user_id,
      this.user_role,
      this.username,
      this.email,
      this.contact_id,
      this.profile_image,
      this.last_location_id,
      this.last_login_date,
      this.isRemember,
      this.staylogin,
      this.userkey,
      this.client_name);
}
