class Users {
  // Properties
  String uid = '';
  String username = '';
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  String bio = 'This person is lazy to set a bio';
  String phone = '';
  String subscription = 'free';

  // Constructor
  Users(this.uid, this.username, this.firstname, this.lastname,
      this.email, this.password, this.bio, this.phone, this.subscription);

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

  String getFirstname() {
    return firstname;
  }

  String getLastname() {
    return lastname;
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
      'fullname': '$firstname $lastname',
      'bio': bio,
      'phone': phone,
      'subscription': subscription,
    };
  }
}
