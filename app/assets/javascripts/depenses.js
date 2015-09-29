$(document).ready(function() {
  $button = document.getElementById("show-admin-menu");
  $menu = document.getElementById("admin-menu");
  function showMenu()
  {
    if ($menu.style.right == "0px")
      $menu.style.right = "-250px";
    else
      $menu.style.right = "0px";
  }

  $button.onclick = showMenu;
});
