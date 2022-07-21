<%@page import="DAOImpl.GenuriMuzicaleDaoImpl"%>
<%@page import="DAOImpl.AlbumeDaoImpl"%>
<%@page import="pojo.GenuriMuzicale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Albume"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artisti inregistrati</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akronim&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allura&amp;display=swap">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href = "style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeArtist").hide();
                $("#modificaArtist").hide();

                $("#update").click(function () {
                    $("#modificaArtist").show();
                    $("#stergeArtist").hide();
                });
                $("#delete").click(function () {
                    $("#stergeArtist").show();
                    $("#modificaArtist").hide();
                });
            });
        </script>

    </head>
    <body>
        <%
            AlbumeDaoImpl albumDaoImpl = new AlbumeDaoImpl();
            GenuriMuzicaleDaoImpl genmuzicalDaoImpl = new GenuriMuzicaleDaoImpl();
            List<Albume> listaAlbume = new ArrayList();
            listaAlbume = albumDaoImpl.afiseazaAlbum();
            List<GenuriMuzicale> listaGenuriMuzicale = new ArrayList();
            listaGenuriMuzicale = genmuzicalDaoImpl.afiseazaGenMuzical();
            request.setAttribute("listaAlbume", listaAlbume);
            request.setAttribute("listaGenuriMuzicale", listaGenuriMuzicale);
        %>
        <nav class="navbar navbar-light navbar-expand-md" style="text-shadow: 0px 0px;box-shadow: 0px 0px 10px 0px;transform: perspective(30px);background: #c89b63;">
        <div class="container-fluid"><a class="navbar-brand" href="adauga_Artist.jsp" style="font-family: Acme, sans-serif;">Adauga datele unui artist</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="index.html" style="margin-left: 1200px;font-family: Acme, sans-serif;">Home</a></li>
                    <form action="AlbumeController" method="POST">
                    <li class="nav-item" type="submit" name="afiseazaAlbum" value="Afiseaza"><button class="nav-link" type="submit" name="afiseazaAlbum" value="Afiseaza" style="margin-left: 39px;font-family: Acme, sans-serif; background-color: transparent; border: none">Albume inregistrate</button></li>
                    </form>
                    <form action="GenuriMuzicaleController" method="POST">
                    <li class="nav-item" ><button class="nav-link"  type="submit" name="afiseazaGenMuzical" value="Afiseaza" style="margin-left: 26px;font-family: Acme, sans-serif; background-color: transparent; border: none">Genuri muzicale inregistrate</button></li>
                    </form>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="wrapper" style="width: 600px;margin-left: -12.5px;margin-bottom: -10px;height: 881px; transform: perspective(500px);border-right: 3px outset rgb(1,8,16);box-shadow: 6px 4px 4px 1px;">
    <form action="ArtistiController" method="POST">
    <p style="margin-left: 100px;padding: 12px;margin-top: 0px;font-family: Allura, serif;font-weight: bold;font-size: 30px;"><input type="checkbox" id="update" style="width: 30px;height: 16px;">Modificati linia selectata&nbsp;</p>
    <p style="margin-left: 100px;height: 46px;font-size: 30px;font-family: Allura, serif;font-weight: bold;">
    <input type="checkbox" id="delete" onclick="document.getElementById('idalbum').disabled = this.checked; document.getElementById('idgen').disabled = this.checked; document.getElementById('nume').disabled = this.checked; document.getElementById('prenume').disabled = this.checked; document.getElementById('data_lansare').disabled = this.checked; document.getElementById('trupa').disabled = this.checked;" style="height: 17px;width: 24px;margin-left: -7px;">Stergeti linia selectata</p>
    <p style="margin-left: 100px;padding: 12px;margin-top: 0px;font-family: Allura, serif;font-weight: bold;font-size: 30px;">Selectati linia:  <select name="idartist" style="width: 50px;height: 30px; font-size: 20px; font-family: Acme, sans-serif;">
    <c:forEach items="${listaArtisti}" var="artisti">
                        <option value="${artisti.idartist}">${artisti.idartist}</option>
                    </c:forEach>
                </select></p>
     <p style="margin-left: 100px;padding: 12px;margin-top: 0px;font-family: Allura, serif;font-weight: bold;font-size: 30px;">Modificati albumul:  <select name="idalbum" style="width: 40px;height: 30px; font-size: 20px; font-family: Acme, sans-serif;">
     <c:forEach items="${listaAlbume}" var="albume">
                        <option value="${albume.idalbum}">${albume.idalbum}, ${albume.nume}, ${albume.tip}</option>
                    </c:forEach>
                </select></p>
     <p style="margin-left: 100px;padding: 12px;margin-top: 0px;font-family: Allura, serif;font-weight: bold;font-size: 30px;">Modificati genul muzical:  <select name="idgen" style="width: 50px;height: 30px; font-size: 20px; font-family: Acme, sans-serif;">
    <c:forEach items="${listaGenuriMuzicale}" var="genurimuzicale">
                        <option value="${genurimuzicale.idgen}">${genurimuzicale.idgen}, ${genurimuzicale.nume}, ${genurimuzicale.data_aparitie}, ${genurimuzicale.tip}</option>
                    </c:forEach>
                </select></p>
     <p style="font-family: Allura, serif;font-weight: bold;font-size: 21px;margin-left: 100px;">Modifica numele artistului :&nbsp;<input id="nume" type="text" name="nume" style="font-family: Acme, sans-serif; width: 200px;height: 26.5px;background: rgba(255,255,255,0);border-width: 0px;border-right-style: none;"></p>
     <p style="font-family: Allura, serif;font-weight: bold;font-size: 21px;margin-left: 100px;">Modifica prenumele artistului :&nbsp;<input id="prenume" type="text" name="prenume" style="font-family: Acme, sans-serif; width: 200px;height: 26.5px;background: rgba(255,255,255,0);border-width: 0px;border-right-style: none;"></p>
     <p style="font-family: Allura, serif;font-weight: bold;font-size: 21px;margin-left: 100px;">Modifica data lansarii artistului :&nbsp;<input id="data_lansare" type="text" name="data_lansare" style="font-family: Acme, sans-serif; width: 200px;height: 26.5px;background: rgba(255,255,255,0);border-width: 0px;border-right-style: none;"></p>
    <p style="font-family: Allura, serif;font-weight: bold;font-size: 21px;margin-left: 100px;">Modifica trupa :&nbsp;<input id="trupa" type="text" name="trupa" style="font-family: Acme, sans-serif; width: 200px;height: 26.5px;background: rgba(255,255,255,0);border-width: 0px;border-right-style: none;"></p>
    <button class="btn btn-primary" type="submit" id="modificaArtist" name="modificaArtist" style="margin-left: 305px;margin-top: 72px;height: 48px;width: 154.5px;border-top-left-radius: 62px;border-bottom-right-radius: 62px;font-family: Acme, sans-serif;background: rgb(200,155,99);border: 3px dotted rgb(255, 255, 255);">Modifica</button>
    <button class="btn btn-primary" type="submit" id="stergeArtist" name="stergeArtist" style="margin-left: 305px;margin-top: 72px;height: 46px;width: 154.5px;border-top-left-radius: 4px;border-bottom-right-radius: 4px;font-family: Acme, sans-serif;background: rgb(200,155,99);border: 3px dotted rgb(255, 255, 255);border-top-right-radius: 62px;border-bottom-left-radius: 62px;">Sterge</button>
    </form>
    
    </div>
    
    <div class="area" style="width: 1325px;margin: -285px 810px 0px;margin-top: -870px;margin-left: 594px;margin-right: 797px; height: 880px;">
     <div class="table-responsive" style="width: 1299px;font-family: 'Archivo Black', sans-serif;">
     <table class="table">
                <thead>
                <tr style="text-align: center;box-shadow: 0px 0px 9px;">
                <th class="text-center flash animated" style="width: 75.656px;filter: contrast(0%) saturate(100%);transform: rotate(0deg);border-top-left-radius: 0px; font-color: white">Id</th>
                <th class="flash animated" style="width: 227.078px; font-color:white; font-family:Comic Sans MS;">Numele artistului</th>
                <th class="flash animated" style="width: 227.078px; font-color:white; font-family:Comic Sans MS;">Prenumele artistului</th>
                <th class="flash animated" style="width: 227.078px; font-color:white; font-family:Comic Sans MS;">Data lansarii artistului</th>
                <th class="flash animated" style="width: 227.078px; font-color:white; font-family:Comic Sans MS;">Trupa</th>
                <th class="flash animated" style="width: 227.078px; font-color:white; font-family:Comic Sans MS;">Numele albumului</th>
                <th class="flash animated" style="width: 227.078px; font-color:white; font-family:Comic Sans MS;">Numele genului muzical</th>
            </tr>
                </thead>
            <thead>
              <c:forEach var="artisti" items="${listaArtisti}">
                <tr style="text-align: center;box-shadow: 0px 0px 9px;">
                    <td style="width: 75.656px;filter: contrast(0%) saturate(53%);transform: rotate(0deg);border-top-left-radius: 0px; font-family: Acme, sans-serif;">${artisti.idartist}</td>
                    <td style="width: 227.078px; font-color:white; font-family:Comic Sans MS">${artisti.nume}</td>
                    <td style="width: 227.078px; font-color:white; font-family:Comic Sans MS">${artisti.prenume}</td>
                    <td style="width: 227.078px; font-color:white; font-family:Comic Sans MS">${artisti.data_lansare}</td>
                    <td style="width: 227.078px; font-color:white; font-family:Comic Sans MS">${artisti.trupa}</td>
                    <td style="width: 227.078px; font-color:white; font-family:Comic Sans MS">${artisti.albume.nume}</td>
                    <td style="width: 227.078px; font-color:white; font-family:Comic Sans MS">${artisti.genurimuzicale.nume}</td>
                           
                    
                </tr>
           </c:forEach>
            </thead>
        </table>
        <div class="circles">
              
               <div></div>
               <div></div> 
               <div></div> 
               <div></div> 
               <div></div> 
               <div></div> 
               <div></div> 
               <div></div> 
               <div></div> 
               <div></div> 
            </div>
    </div>
     <script src="assets/bootstrap/js/bootstrap.min.js"></script>
     
       
        
    </body>
     <style>
    
    .wrapper {
    background: linear-gradient(-45deg,#f9f3eb, #eddbc4, #d0a368, #b07b36, #755224);
    background-size: 400% 400%;
    animation: gradient 15s ease infinite;
   
}

@keyframes gradient {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}



@import url('https://fonts.googleapis.com/css?family=Exo:400,700');
.area{
    background: #d5ac76;  
    background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);  
    position: absolute;
    
   
}

.circles{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.circles div{
    position: absolute;
    
    list-style: none;
    width: 20px;
    height: 20px;
    background: rgba(255, 255, 255, 0.2);
    animation: animate 25s linear infinite;
    bottom: -150px;
    
}

.circles div:nth-child(1){
    left: 25%;
    width: 80px;
    height: 80px;
    animation-delay: 0s;
}


.circles div:nth-child(2){
    left: 10%;
    width: 20px;
    height: 20px;
    animation-delay: 2s;
    animation-duration: 12s;
}

.circles div:nth-child(3){
    left: 70%;
    width: 20px;
    height: 20px;
    animation-delay: 4s;
}

.circles div:nth-child(4){
    left: 40%;
    width: 60px;
    height: 60px;
    animation-delay: 0s;
    animation-duration: 18s;
}

.circles div:nth-child(5){
    left: 65%;
    width: 20px;
    height: 20px;
    animation-delay: 0s;
}

.circles div:nth-child(6){
    left: 75%;
    width: 110px;
    height: 110px;
    animation-delay: 3s;
}

.circles div:nth-child(7){
    left: 35%;
    width: 150px;
    height: 150px;
    animation-delay: 7s;
}

.circles div:nth-child(8){
    left: 50%;
    width: 25px;
    height: 25px;
    animation-delay: 15s;
    animation-duration: 45s;
}

.circles div:nth-child(9){
    left: 20%;
    width: 15px;
    height: 15px;
    animation-delay: 2s;
    animation-duration: 35s;
}

.circles div:nth-child(10){
    left: 85%;
    width: 150px;
    height: 150px;
    animation-delay: 0s;
    animation-duration: 11s;
}



@keyframes animate {

    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }

    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
    }

}



    </style>
</html>