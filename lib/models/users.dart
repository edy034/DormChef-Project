class Users {
  // Properties
  String uid = '';
  String username = '';
  String fullname = '';
  String email = '';
  String password = '';
  String bio = '';
  String phone = '';
  String subscription = '';

  // Constructor
  Users();

  // Setters
  void setUid(String uid) {
    this.uid = uid;
  }
  void setUsername(String username) {
    this.username = username;
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
  String getFullname() {
    return fullname;
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
      'subscription': subscription,
    };
  }
}