class Console
  def self.menu_create
    a=["Log Out",0,"log_out","both","sessions","destroy",1]
    Menu.create({:title=>a[0], :parent_id=>a[1], :alias_name=>a[2], :access=>a[3], :controller=>a[4],:action=>a[5],:sequence_number=>a[6]})
  end

  def self.user_create
    a=["lokesh","lokeshwrn27@gmail.com","1","1","editor"]
    Menu.encrypt_password(a)
    User.create(a)
  end
end