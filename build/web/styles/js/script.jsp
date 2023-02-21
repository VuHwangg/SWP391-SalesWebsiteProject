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
    
      // Quantity input buy plus and minus button -----------------------------
     // Get all the quantity input tags on the page
        const quantityInputs = document.querySelectorAll('.quantity-input');

        // Add click event listeners to each of the quantity input tags
        quantityInputs.forEach(function(quantityInput) {
          const minusBtn = quantityInput.querySelector('.minus-btn');
          const plusBtn = quantityInput.querySelector('.plus-btn');
          const quantity = quantityInput.querySelector('.quantity');
          
          const numberInputs = document.querySelectorAll('.numberInputHidden');
          

          minusBtn.addEventListener('click', function() {
            let value = parseInt(quantity.value);
            if (value > 1) {
              value--;
            }
            quantity.value = value;
            quantity.dispatchEvent(new Event('change'));
            for(let i = 0; i < numberInputs.length; i++) {
                numberInputs[i].value = value;
            }
          });

          plusBtn.addEventListener('click', function() {
            let value = parseInt(quantity.value);
            if (value < 99) {
              value++;
            }
            quantity.value = value;
            quantity.dispatchEvent(new Event('change'));
            for(let i = 0; i < numberInputs.length; i++) {
                numberInputs[i].value = value;
            }
          });

          quantity.addEventListener('input', function() {
            validateInput(quantity);
          });

          quantity.addEventListener('blur', function() {
            validateInput(quantity);
          });

          function validateInput(input) {
            let value = parseInt(input.value);
            if (isNaN(value) || value < 1 || value > 99) {
              alert('Value must be an integer, greater than 0 and less than 100!');
              input.value = 1;
            } else {
              input.value = value;
            }
          }
        });

      
      
      //Slider images -----------------------------------------------------------
      function change_image(image){
        var container = document.getElementById("main-image");
        container.src = image.src;
      }
      document.addEventListener("DOMContentLoaded", function(event) {
      });
</script>