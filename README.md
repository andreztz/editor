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
- **`;`** → **Repete** o último `f`, `F`, `t` ou `T` na **mesma direção**.  
- **`,`** → **Repete** o último `f`, `F`, `t` ou `T` na **direção oposta**.  

### 🔹 Exemplo:
1. Digite `fx` para mover o cursor até o próximo **"x"** na linha.  
2. Pressione `.` para continuar indo para o próximo **"x"** na linha.  
3. Pressione `.` para voltar para o **"x"** anterior.  


