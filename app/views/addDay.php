<form action="" method="post">
    <label for="calendar">Wybierz dzien:</label>
    <input type="date" name="calendar" id="calendar" autofocus><br><br>

    <label for="id_worker">Podaj nr id pracownika:</label>
    <input type="text" name="id_worker" id="id_worker" autofocus><br><br>

    <label for="hours">Ilość godzin:</label>
    <input type="hours" name="hours"  id="hours" pattern="^([0-9]|1[0-9]|2[0-4])$" title="Wprowadź poprawną ilość godzin od 1 do 24"><br><br>

    <label for="comment_superviser">Komentarz kierownika:</label>
    <input type="comment_superviser" name="comment_superviser" id="comment_superviser"><br><br>

    <input type="submit" value="Wprowadzenie">
</form>
<a href="./app/views/home.php">Powrót</a>