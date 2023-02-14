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
    }
    
    function Show2() {
      collapseInfo[0].classList.remove('show')
      collapseInfo[1].classList.add('show')
    }
    
    // Range Prices product --------------------------------------------------
    
    const rangeInput = document.querySelectorAll(".range-input input"),
    priceInput = document.querySelectorAll(".price-input input"),
    range = document.querySelector(".slider .progress");
    let priceGap = 1000;

    priceInput.forEach(input =>{
        input.addEventListener("input", e =>{
            let minPrice = parseInt(priceInput[0].value),
            maxPrice = parseInt(priceInput[1].value);

            if((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max){
                if(e.target.className === "input-min"){
                    rangeInput[0].value = minPrice;
                    range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
                }else{
                    rangeInput[1].value = maxPrice;
                    range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
                }
            }
        });
    });

    rangeInput.forEach(input =>{
        input.addEventListener("input", e =>{
            let minVal = parseInt(rangeInput[0].value),
            maxVal = parseInt(rangeInput[1].value);

            if((maxVal - minVal) < priceGap){
                if(e.target.className === "range-min"){
                    rangeInput[0].value = maxVal - priceGap
                }else{
                    rangeInput[1].value = minVal + priceGap;
                }
            }else{
                priceInput[0].value = minVal;
                priceInput[1].value = maxVal;
                range.style.left = ((minVal / rangeInput[0].max) * 100) + "%";
                range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
            }
        });
    });
    
    // Quantity input for Product Detail----------------------------------------
    const minusBtn = document.querySelector("#minusBtn");
      const plusBtn = document.querySelector("#plusBtn");
      const numberInput = document.querySelector("#numberInput");
      
      minusBtn.addEventListener("click", function() {
        let value = parseInt(numberInput.value);
        if (value > 1) {
          value--;
        }
        numberInput.value = value;
      });
      
      plusBtn.addEventListener("click", function() {
        let value = parseInt(numberInput.value);
        if (value < 99) {
          value++;
        }
        numberInput.value = value;
      });
      
      // Quantity input for Cart ----------------------------------------
      $('.minus-btn').on('click', function(e) {
            e.preventDefault();
            var $this = $(this);
            var $input = $this.closest('div').find('input');
            var value = parseInt($input.val());

            if (value &amp;amp;gt; 1) {
                value = value - 1;
            } else {
                value = 0;
            }

          $input.val(value);

        });

        $('.plus-btn').on('click', function(e) {
            e.preventDefault();
            var $this = $(this);
            var $input = $this.closest('div').find('input');
            var value = parseInt($input.val());

            if (value &amp;amp;lt; 100) {
                value = value + 1;
            } else {
                value =100;
            }

            $input.val(value);
        });
      
      
      //Slider images -----------------------------------------------------------
      function change_image(image){
        var container = document.getElementById("main-image");
        container.src = image.src;
      }
      document.addEventListener("DOMContentLoaded", function(event) {
      });
</script>