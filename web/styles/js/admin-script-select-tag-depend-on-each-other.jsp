<script>

    const typeSelect = document.getElementById("inputTypeProduct");
    
    // List Option Brand    
    const phoneBrandOptions = document.querySelectorAll("#inputBrandProduct option[value='samsung'], #inputBrandProduct option[value='phone-apple'], #inputBrandProduct option[value='phone-other']");
    const laptopBrandOptions = document.querySelectorAll("#inputBrandProduct option[value='laptop-apple'], #inputBrandProduct option[value='asus'], #inputBrandProduct option[value='hp'], #inputBrandProduct option[value='gigabyte'], #inputBrandProduct option[value='dell'], #inputBrandProduct option[value='msi'], #inputBrandProduct option[value='huawei'], #inputBrandProduct option[value='laptop-other']");
    
    // List Option Demand    
    const phoneDemandOptions = document.querySelectorAll("#inputDemandProduct option[value='photography'], #inputBrandProduct option[value='phone-gaming'], #inputBrandProduct option[value='phone-other']");
    const laptopDemandOptions = document.querySelectorAll("#inputDemandProduct option[value='office'], #inputBrandProduct option[value='asus'], #inputBrandProduct option[value='hp'], #inputBrandProduct option[value='gigabyte'], #inputBrandProduct option[value='dell'], #inputBrandProduct option[value='msi'], #inputBrandProduct option[value='huawei'], #inputBrandProduct option[value='laptop-other']");
    
    
    typeSelect.addEventListener("change", function () {
        if (typeSelect.value === "phone") {
            for (let i = 0; i < laptopBrandOptions.length; i++) {
                laptopBrandOptions[i].style.display = "none";
            }
            for (let i = 0; i < phoneBrandOptions.length; i++) {
                phoneBrandOptions[i].style.display = "";
            }
        } else {
            for (let i = 0; i < phoneBrandOptions.length; i++) {
                phoneBrandOptions[i].style.display = "none";
            }
            for (let i = 0; i < laptopBrandOptions.length; i++) {
                laptopBrandOptions[i].style.display = "";
            }
        }
    });


</script>