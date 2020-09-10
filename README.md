Flutter App de Clima
=======================

![](https://github.com/maickom88/app_de_clima_flutter/blob/master/screenshots/spalsh_screen.png?raw=true)
![](https://github.com/maickom88/app_de_clima_flutter/blob/master/screenshots/weather_screen.png?raw=true)
![](https://github.com/maickom88/app_de_clima_flutter/blob/master/screenshots/acesso_negado_screen.png)
![](https://github.com/maickom88/app_de_clima_flutter/blob/master/screenshots/error_screen.png?raw=true)



## ✔️ Instalação

#### ❗️ Attention ❗️
Para o uso desse app é necessario clonar o repository do [App de Clima Web](https://github.com/maickom88/app_de_clima_web) e seguir todas instruções. 

Clone esse repositorio, e use o comando abaixo!
```dart
 flutter pub get
```
...Agora é só iniciar o Debug


#### ❗️ Attention ❗️
Se você irá usar o proprio device para emular é necessario mudar a url base
nos arquivos de constants no lib -> core -> constants-> [url_api.dart](https://github.com/maickom88/app_de_clima_flutter/blob/master/lib/core/constants/url_api.dart). 

##### Exemplo
```dart
  static const urlBase = "http://SEU_IP_:8000/api";
```

E não esqueça de usar o comando na pasta raiz do projeto web 
```php
 php artisan serve --host 0.0.0.0
```
