# Editor

![](https://private-user-images.githubusercontent.com/7193527/418322205-0abf086f-89e8-4f12-8944-b8af27c31596.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDA4OTE2OTIsIm5iZiI6MTc0MDg5MTM5MiwicGF0aCI6Ii83MTkzNTI3LzQxODMyMjIwNS0wYWJmMDg2Zi04OWU4LTRmMTItODk0NC1iOGFmMjdjMzE1OTYucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMwMiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMDJUMDQ1NjMyWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9ODY5YTZhOGIzNjQwYjkwYzcyMmQxYzc5MTBjY2JiMTZmYjkyNDgwOTIyZjY4ZWJlYWI2OTZhYzgwNzFjNWI2OSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.Zsa1JSuPZvtQ7Xv60_4N-DTGiJGaDhjYBJJ8vs5zeNM)


# Instruções de uso

leader key  -> `;`

## Terminal

|Descrição              | Comando          |
|-----------------------|------------------|
|Abrir terminal         |`leader-tt`       |
|Sair do modo inserção  |`Ctrl-\ + Ctrl-n` |


# Observações 📌


## Remapeamento na busca de caractere em linha

Como o caractere `;` foi definido como leader, foi necessário remapear as funções de busca de caractere em linha. O novo mapeamente definido no arquivo `lua/keymaps.lua` é:

- `;` agora corresponde a `.`


`.` **repete o último comando de busca de caractere em linha** (`f`, `F`, `t`, `T`):  

- **`f<char>`** → Move o cursor para a **próxima ocorrência** do caractere `<char>` na linha.  
- **`F<char>`** → Move o cursor para a **ocorrência anterior** do caractere `<char>` na linha.  
- **`t<char>`** → Move o cursor **antes** do próximo `<char>` na linha.  
- **`T<char>`** → Move o cursor **antes** da ocorrência anterior de `<char>` na linha.  
- **`.`** → **Repete** o último `f`, `F`, `t` ou `T` na **mesma direção**.  
- **`,`** → **Repete** o último `f`, `F`, `t` ou `T` na **direção oposta**.  

### 🔹 Exemplo:
1. Digite `fx` para mover o cursor até o próximo **"x"** na linha.  
2. Pressione `.` para continuar indo para o próximo **"x"** na linha.  
3. Pressione `,` para voltar para o **"x"** anterior.  
