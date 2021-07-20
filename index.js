function chatear(a) {
    const Http = new XMLHttpRequest();
    Http.open("GET", '/test.php' + '?a=' + a, true);
    Http.send();
}