class UrlApi {
  //E rode o comando na pasta raiz do projeto web laravel
  //"php artisan serve"(sem aspas)!
  static const urlBase = "http://127.0.0.1:8000/api";

  //Caso você use o proprio smarthphone use essa url!
  //E rode o comando na pasta raiz do projeto web laravel
  //"php artisan serve --host 0.0.0.0" (sem aspas)!
  //static const urlBase = "http://SEU-IP:8000/api";

  static const urlApi = "$urlBase/city";
}
