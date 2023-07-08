class Users {
  // Properties
  String uid = '';
  String username = '';
  String firstname = '';
  String lastname = '';
  String fullname = '';
  String email = '';
  String password = '';
  String bio = 'This person is lazy to set a bio';
  String phone = '';
  String profilePic = '';
  String subscription = '';

  // Constructor
  Users();
  Users.withName(this.uid, this.username, this.firstname, this.lastname, this.email,
      this.bio, this.phone, this.profilePic, this.subscription);


  // Setters
  void setUid(String uid) {
    this.uid = uid;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setFirstname(String firstname) {
    this.firstname = firstname;
  }

  void setLastname(String lastname) {
    this.lastname = lastname;
  }
  
  void setFullname(String fullname) {
    this.fullname = fullname;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setBio(String bio) {
    this.bio = bio;
  }

  void setProfilePic(String profilePic) {
    this.profilePic = profilePic;
  }

  void setPhone(String phone) {
    this.phone = phone;
  }

  void setSubscription(String subscription) {
    this.subscription = subscription;
  }

  // Getters
  String getUid() {
    return uid;
  }

  String getUsername() {
    return username;
  }

  String getEmail() {
    return email;
  }

  String getPassword() {
    return password;
  }

  String getBio() {
    return bio;
  }

  String getPhone() {
    return phone;
  }

  String getProfilePic() {
    return profilePic;
  }

  String getSubscription() {
    return subscription;
  }

  // Convert user object to map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'username': username,
      'fullname': fullname,
      'bio': bio,
      'phone': phone,
      'profilePic': profilePic,
      'subscription': subscription,
    };
  }

  static Users fromJson(jsonDecode) {
    Users user = Users();
    user.setUid(jsonDecode['uid']);
    user.setUsername(jsonDecode['username']);
    user.setFirstname(jsonDecode['firstname']);
    user.setLastname(jsonDecode['lastname']);
    user.setEmail(jsonDecode['email']);
    user.setBio(jsonDecode['bio']);
    user.setPhone(jsonDecode['phone']);
    user.setProfilePic(jsonDecode['profilePic']);
    user.setSubscription(jsonDecode['subscription']);
    return user;
  }
}
