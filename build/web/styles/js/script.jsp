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
      
      
    const collapseInfo = document.querySelectorAll('.collapse-info')
    function Show1() {
      collapseInfo[0].classList.add('show')
      collapseInfo[1].classList.remove('show')
      collapseInfo[2].classList.remove('show')
    }
    
    function Show2() {
      collapseInfo[0].classList.remove('show')
      collapseInfo[1].classList.add('show')
      collapseInfo[2].classList.remove('show')
    }
    
    function Show3() {
      collapseInfo[0].classList.remove('show')
      collapseInfo[1].classList.remove('show')
      collapseInfo[2].classList.add('show')
    }
    
</script>