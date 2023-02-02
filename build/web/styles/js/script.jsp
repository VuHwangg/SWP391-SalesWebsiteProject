<script>
//    Navbar script
    let nav = document.querySelector(".navbar");
      window.addEventListener("scroll", () => {
        if (document.documentElement.scrollTop > 20) {
          nav.classList.add("mini-banner-off");
        } else {
          nav.classList.remove("mini-banner-off");
        }
      });
</script>