{ lib, ... }:

{
  users.users."luna" = {
    isNormalUser = true;
    description = "Luna";
    group = "luna";
    extraGroups = [ "networkmanager" "wheel" ];
    initialHashedPassword = lib.mkDefault "$y$j9T$QH6ZX7xBXBnJvNsvAnEQJ1$EetT5SbC.Qq4iEWlAl2edwFJkQb44EwbVqDwslGXKhD";
  };

  users.groups."luna" = {};
}
