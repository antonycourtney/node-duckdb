# Supporting node-duckdb on Windows 

## Specifically
- Windows 10 with Visual Studio 2019
- DuckDB from HEAD 
- Build natively using yarn

## Prerequisites
- Visual Studio 2019 (although not tested, community edition should work)
- NodeJS LTS or latest version installed
- The following NodeJS modules installed globally:
  + cmake-js
  + node-addon-api
  + jest
  + rimraf
  + yarn
- Create an environment variable NODE_PATH that points to globally installed node modules. <br>
   (Note: On windows, by default the node modules are installed under %appdata%\npm\node_modules)
- Download prebuilt OpenSSL from https://mirror.firedaemon.com/OpenSSL/openssl-1.1.1m.zip and extract to somedir\openssl-1.1<br>
   (Note: It is advisable to build OpenSSL from source using VCPkg)
- Create an environment variable OPENSSL_ROOT_DIR and point to somedir\openssl-1.1\x64

## Building node-duckdb
> There are just two steps to build duckdb for windows
> Download this repository and issue the following commands:
> + yarn download-duckdb
> + yarn build:windows

## Pitfalls
- If you find errors like <br>
<code>
node:internal/modules/cjs/loader:936
  throw err;
  ^

Error: Cannot find module 'node-addon-api'
Require stack:
 D:\Work\Antony\windows-asis\[eval]
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:933:15)
    at Function.Module._load (node:internal/modules/cjs/loader:778:27)
    at Module.require (node:internal/modules/cjs/loader:1005:19)
    at require (node:internal/modules/cjs/helpers:102:18)
    at [eval]:1:1
</code>
  <br>Make sure NODE_PATH is set correctly. 

- While running the tests if you find errors like <br>
<code>
 FAIL  dist/tests/result-stream.test.js
  ● Test suite failed to run

    The specified module could not be found.
    \\?\path\node-duckdb\build\Release\node-duckdb-addon.node

      10 | // lambda doesn't work with npm module bindings
      11 | // eslint-disable-next-line node/no-unpublished-require, @typescript-eslint/no-var-requires
     12 | const { Connection } = require("../../build/Release/node-duckdb-addon.node");
</code>
<br>Make sure both libcrypto-1_1-x64.dll and libssl-1_1-x64.dll are in the path

## Important Disclaimer:
We have not been able to get the tests running on Windows. This work is underway.