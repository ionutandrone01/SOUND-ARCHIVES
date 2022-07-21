<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Genuri muzicale inregistrate</title>
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
                $("#stergeGenMuzical").hide();
                $("#modificaGenMuzical").hide();

                $("#update").click(function () {
                    $("#modificaGenMuzical").show();
                    $("#stergeGenMuzical").hide();
                });
                $("#delete").click(function () {
                    $("#stergeGenMuzical").show();
                    $("#modificaGenMuzical").hide();
                });
            });
        </script>

    </head>
    <body>
        <nav class="navbar navbar-light navbar-expand-md" style="text-shadow: 0px 0px;box-shadow: 0px 0px 10px 0px;transform: perspective(30px);background: #c89b63;">
        <div class="container-fluid"><a class="navbar-brand" href="adauga_GenMuzical.jsp" style="font-family: Acme, sans-serif;">Adauga un gen muzical</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="index.html" style="margin-left: 1250px;font-family: Acme, sans-serif;">Home</a></li>
                    <form action="AlbumeController" method="POST">
                    <li class="nav-item" type="submit" name="afiseazaAlbum" value="Afiseaza"><button class="nav-link" type="submit" name="afiseazaAlbum" value="Afiseaza" style="margin-left: 39px;font-family: Acme, sans-serif; background-color: transparent; border: none">Albume inregistrate</button></li>
                    </form>
                    <form action="ArtistiController" method="POST">
                    <li class="nav-item" ><button class="nav-link"  type="submit" name="afiseazaArtist" value="Afiseaza" style="margin-left: 26px;font-family: Acme, sans-serif; background-color: transparent; border: none">Artisti inregistrati</button></li>
                    </form>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container" style="width: 834px;margin-left: -12.5px;margin-bottom: -10px;height: 881px;background: url('pentrutabela.png') no-repeat, var(--bs-pink);background-size: cover, auto;transform: perspective(500px);border-right: 3px outset rgb(1,8,16);box-shadow: 6px 4px 4px 1px;">
    <form action="GenuriMuzicaleController" method="POST">
        <p style="margin-left: 343px;padding: 12px;margin-top: 0px;font-family: Allura, serif;font-weight: bold;font-size: 30px;"><input type="checkbox" id="update" style="width: 30px;height: 16px;">Modificati linia selectata&nbsp;</p>
        <p style="margin-left: 366px;height: 46px;font-size: 30px;font-family: Allura, serif;font-weight: bold;"><input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked; document.getElementById('data_aparitie').disabled = this.checked; document.getElementById('tip').disabled = this.checked;" style="height: 17px;width: 24px;margin-left: -7px;">Stergeti linia selectata</p>
        <p style="margin-left: 343px;padding: 12px;margin-top: 0px;font-family: Allura, serif;font-weight: bold;font-size: 30px;">Selectati linia:<select name="idgen" style="width: 50px;height: 30px; font-size: 20px; font-family: Acme, sans-serif;">
                    <c:forEach items="${listaGenuriMuzicale}" var="genurimuzicale">
                        <option value="${genurimuzicale.idgen}">${genurimuzicale.idgen}</option>
                    </c:forEach>
                </select></p>
        <p style="font-family: Allura, serif;font-weight: bold;font-size: 21px;margin-left: 325px;">Modifica numele genului muzical: &nbsp;<input id="nume" type="text" name="nume" style="font-family: Acme, sans-serif; width: 200px;height: 26.5px;background: rgba(255,255,255,0);border-width: 0px;border-right-style: none;"></p>
        <p style="font-family: Allura, serif;font-weight: bold;font-size: 21px;margin-left: 325px;">Modifica data aparitiei genului muzical: <input id="data_aparitie" type="text" name="data_aparitie" style="font-family: Acme, sans-serif; width: 182px;height: 20.5px;background: rgba(255,255,255,0);border-width: 0px;"></p>
        <p style="font-family: Allura, serif;font-weight: bold;font-size: 21px;margin-left: 325px;">Modifica tipul genului muzical: <input id="tip" type="text" name="tip" style="font-family: Acme, sans-serif; width: 219px;height: 26.5px;border-width: 0px;background: rgba(255,255,255,0);"></p>
        <button class="btn btn-primary" type="submit" id="modificaGenMuzical" name="modificaGenMuzical" style="margin-left: 629px;margin-top: 288px;height: 48px;width: 154.5px;border-top-left-radius: 62px;border-bottom-right-radius: 62px;font-family: Acme, sans-serif;background: rgb(200,155,99);border: 3px dotted rgb(255, 255, 255);">Modifica</button>
         <button class="btn btn-primary" type="submit" id="stergeGenMuzical" name="stergeGenMuzical" style="margin-left: 629px;margin-top: 72px;height: 46px;width: 154.5px;border-top-left-radius: 4px;border-bottom-right-radius: 4px;font-family: Acme, sans-serif;background: rgb(200,155,99);border: 3px dotted rgb(255, 255, 255);border-top-right-radius: 62px;border-bottom-left-radius: 62px;">Sterge</button>
     </form>
    </div>
    <div class="wrapper" style="width: 1091px;margin: -285px 810px 0px;margin-top: -882px;margin-left: 829px;margin-right: 797px; height: 882px;">
     <div class="table-responsive" style="width: 1065px;font-family: 'Archivo Black', sans-serif;">
     <table class="table">
                <thead>
                <tr style="text-align: center;box-shadow: 0px 0px 9px;">
                        <th class="text-center flash animated" style="width: 75.656px;filter: contrast(0%) saturate(100%);transform: rotate(0deg);border-top-left-radius: 0px; font-color: white">Id</th>
                        <th class="flash animated" style="width: 227.078px; font-color:white; font-family:Comic Sans MS;">Nume gen muzical</th>
                        <th class="flash animated" style="width: 439.281px; font-color:white; font-family:Comic Sans MS;">Data aparitiei genului muzical</th>
                        <th class="flash animated" style="font-color:white; font-family:Comic Sans MS;">Tipul genului muzical</th>
                    </tr>
                </thead>
            <thead>
            <c:forEach var="genurimuzicale" items="${listaGenuriMuzicale}">
                <tr style="text-align: center;box-shadow: 0px 0px 9px;">
                    <td style="width: 75.656px;filter: contrast(0%) saturate(53%);transform: rotate(0deg);border-top-left-radius: 0px; font-family: Acme, sans-serif;">${genurimuzicale.idgen}</td>
                    <td style="width: 227.078px; font-family: Acme, sans-serif;">${genurimuzicale.nume}</td>
                    <td style="width: 439.281px; font-family: Acme, sans-serif;">${genurimuzicale.data_aparitie}</td>
                    <td style="font-family: Acme, sans-serif;">${genurimuzicale.tip}</td>

                </tr>
            </c:forEach>
            </thead>
        </table>
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

    </style>
</html>