ScaleAPI
=======

Basic notes to run ScaleAPI

### 1. Versions

ScaleAPI it's using ruby version 2.0 and rails version 4.0. You can find the required gems specified in the Gem file. We recommend the use of rvm for install all required components.

### 2. How to start ScaleAPI

Once configured, you can run manually ScaleAPI in localhost:
```bash
bash#> rackup
```
Yoy may need to bundle install missing gems and/or create database model

### 3. Sending statistics to ScaleAPI

Sample:
```bash
curl -X POST http://localhost:9292/api/tic/? -H "Content-Type:application/json" -d '[{"metrics":{"cpu":10,"ram":720,"load":2.5},"auth":{"apikey":"inwwgmjgmndtjjgh","apisecret":"bkgqemuwymxatampiipisgcptzjdwnkj","uuid":"udokyybytzadqsomdxtvqwykadhniblnvqye"}}]'
```

AbiSaaS need aditional components to be configured:

