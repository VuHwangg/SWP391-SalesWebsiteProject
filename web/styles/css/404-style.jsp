<style>
    
* {
    font-family: sans-serif;
}

  body {
    background-color: #dc3545;
  }
  svg {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -250px;
    margin-left: -400px;
  }

  h3 {
      text-shadow: 3px 3px 5px #555555;
  }

  h5 {
      position: absolute;
      top: 40%;
      left: 40%;
  }
  .message-box {
    height: 200px;
    width: 380px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -100px;
    margin-left: 50px;
    color: #FFF;
    font-family: Roboto;
    font-weight: 300;
  }
  .message-box h1 {
    font-size: 80px;
    line-height: 46px;
    margin-bottom: 40px;
    text-shadow: 4px 4px 8px #555555;
  }
  .buttons-con .action-link-wrap {
    margin-top: 40px;
  }
  .buttons-con .action-link-wrap a {
    padding: 8px 25px;
    border-radius: 4px;
    border: 2px solid white;
    color: #FFF;
    font-weight: bold;
    transition: all 0.2s linear;
    cursor: pointer;
    text-decoration: none;
    margin-right: 10px;
    text-shadow: 3px 3px 5px #555555;
    box-shadow: 3px 3px 5px #555555;
  }
  .buttons-con .action-link-wrap a:hover {
    background: white;
    color: #dc3545;
    text-shadow: none;
  }

  #Polygon-1 , #Polygon-2 , #Polygon-3 , #Polygon-4 , #Polygon-4, #Polygon-5 {
    animation: float 1s infinite ease-in-out alternate;
  }
  #Polygon-2 {
    animation-delay: .2s; 
  }
  #Polygon-3 {
    animation-delay: .4s; 
  }
  #Polygon-4 {
    animation-delay: .6s; 
  }
  #Polygon-5 {
    animation-delay: .8s; 
  }

  @keyframes float {
          100% {
      transform: translateY(20px);
    }
  }
  @media (max-width: 780px) {
    svg {
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -250px;
      margin-left: -190px;
    }
    .message-box {
      top: 50%;
      left: 50%;
      margin-top: -100px;
      margin-left: -190px;
      text-align: center;
    }
  }
    
</style>