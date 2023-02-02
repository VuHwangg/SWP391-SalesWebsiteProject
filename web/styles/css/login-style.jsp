<style>
body{
    height: 100vh;
    background: linear-gradient(180deg, #b60303, #dd9700);
    background-size: 300% 300%;
    animation: gradientFade 10s ease infinite;
}

@keyframes gradientFade {
    0%{
        background-position: 47% 20%;
    }
    50%{
        background-position: 64% 90%;
    }
    100%{
        background-position: 47% 20%;
    }
}

.bi-google {
    color: #EA4335;
    
}

.btn-google{
    border: 3px solid #EA4335;
    
}

.btn-google:hover
{
    background-color: #EA4335;
    color: white;
}

.btn-google:hover .bi-google{
    color: white;
}
.btn-submit {
    font-size: 18px; 
    font-weight: 500; 
    background-color: #EA4335;
    color: white;
}

.btn-submit:hover {
    background-color: #a62c21;
    color: white;
}

</style>
