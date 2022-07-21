<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Genuri Muzicale</title>
    </head>
    <body>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        
            <p style="width: 956px;height: 36px;margin: 57px;margin-right: 71px;margin-bottom: 66px;margin-left: 900px;padding: 14px;font-weight: bold;font-size: 30px; font-family: Lucida Handwriting">Va rugam sa introduceti datele unui nou gen muzical. </p>
             <div style="width: 605px;background: var(--bs-pink);height: 670px;color: var(--bs-red);margin: -10px;margin-top: 52px;margin-right: 134px;margin-left: 474px;padding: 18px;margin-bottom: 0px;">
             

<form action="GenuriMuzicaleController" method="POST">
<button class="flicker" type="submit" id="rcorners1" name="afiseazaGenMuzical" value="Afiseaza" style="margin-top: 80px;margin-right: 25px;margin-left: 201px;padding: 11px 12px;width: 250px;height: 87px; font-family: Trebuchet MS; font-size:20px ">Vezi genurile muzicale inregistrate</button>
</form>
<button class="flicker" type="button" id="rcorners1" style="margin-top: 114px;margin-right: 25px;margin-left: 201px;padding: 11px 12px;width: 191.5px;height: 87px;"><a href="index.html" style="color:white; text-decoration:none; font-family: Trebuchet MS; font-size:20px">Back to home</a></button>
 <form action="GenuriMuzicaleController" method="GET">
<button  class="flicker" type="submit" id="rcorners1" name="adaugaGenMuzical" value="Adauga" style="margin-top: 154px;margin-right: 25px;margin-left: 201px;padding: 11px 12px;width: 230px;height: 87px; font-family: Trebuchet MS; font-size:20px">Adauga genul muzical</button>
</div>
<div style="height: 771px;color: var(--bs-blue);background: var(--bs-blue);margin-top: -800px;width: 745px;margin-right: -101px;margin-left: 900px;">

                         </br>
                            </br>
                               </br>
                                  </br>
                                     </br>
                                        </br>
                                           </br>
                        <p style="width: 956px;height: 36px; font-weight: bold;font-size: 20px; font-family: Lucida Handwriting; text-align: center"> Numele genului muzical:
                        <input class="no-outline" type="text" name="nume">
                        </p>
                         </br>
                                        </br>
                                           </br>
                        <p style="width: 956px;height: 36px; font-weight: bold;font-size: 20px; font-family: Lucida Handwriting; text-align: center"> Data aparitiei genului muzical: 
                        <input class="no-outline" type="text" name="data_aparitie" >
                       </p>
                      </br>
                                        </br>
                                           </br>
                       <p style="width: 956px;height: 36px; font-weight: bold;font-size: 20px; font-family: Lucida Handwriting; text-align: center">Tipul genului muzical: 
                      <input class="no-outline" type="text" name="tip">
                      </p>
                    
                
            </form>
</div>
           
                
    </body>
    <style>
    body{
    background-image: url('adaugare.jpg');
    background-repeat: no-repeat;
    background-size: 2000px 1000px;
    }
   .flicker {
    width: 350px;
    padding: 5px 10px;
    background-color: #f00;
    color: #fff;
    border: 0;
    border-radius: 10px;
    outline: 0;
    animation: wink 3s linear infinite;
  }
  .flicker:active {
    animation: none;
  }
@keyframes wink {
  50% {background-color: #fff; color:#f00; opacity: 0; }
}

#rcorners1 {
  border-radius:5px 30px 30px 5px;
  background: #cd9c51;
  padding: 20px; 
  width: 490px;
  height: 60px;
  text-align: left;  
}
 input {
        border-top-style: hidden;
        border-right-style: hidden;
        border-left-style: hidden;
        border-bottom-style: hidden;
        background: none;
        font-size: 20px; 
        font-family: Trebuchet MS; 
        
        
      }
.no-outline:focus {
        outline: none;
      }

    </style>
</html>
