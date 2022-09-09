
# Muvver Jera  Test

Olá, eu sou o André, e esse é o aplicativo que desenvolvi como parte do processo seletivo da empresa Jera.


## Instruções para rodar o projeto

### 1- Acesso a API Google Maps

Para rodar o projeto, é necessário uma chave da API google maps.

Os serviços utilizados serão:

- Google Places API
- Maps SDK for Android
- Maps SDK for IOS
- Directions API

A chave da API pode ser obtida no site google developers:
https://developers.google.com/maps

### 2- Inserindo a chave no projeto

A chave deve ser colocada em três lugares.

O primeiro é na variável API_KEY localizada no caminho:
```
 lib/data/remote/maps/maps_service.dart
```

O valor da String deve ser substituído pela Chave.

O segundo é no Android Manifest:
```
android/app/src/main/AndroidManifest.xml
```
O valor a ser substituído está dentro do primeiro <meta-data> após a tag de abertura <application>.


O terceiro local é no AppDelegate.swift:
```
ios/Runner/AppDelegate.swift
```
O valor a ser substituído é a string presente neste arquivo.

Para mais detalhes acesse:

https://pub.dev/packages/google_maps_flutter

### 3 - Rodando o projeto

Para executar este projeto você deve:

- Ter o Flutter instalado na sua máquina.
- Possuir algum editor de códigos ou IDE como o Android Studio.

Para rodá-lo, primeiramente, use o comando ```flutter pub get``` no diretório do projeto. E então basta usar o comando ```flutter run``` ou ```flutter run —release``` - também no diretório do projeto.



## Tecnologias utilizadas:

- Bloc e Cubit
- Banco de dados Hive (chave-valor)
- Comunicação com Web API
- Funções de extensão
- Widgets
- Testes unitários
- Injeção de dependencias - Provider
    
