# elixir_project

This repo consists of 2 projects 
1. Cards
2. Generating Identicon

## How to use the app
### 1. Cards
Run the following command on the CLI in order
1. `cd cards`
2. `mix deps.get` to install the dependencies
3. `iex -S mix`
4. `Cards.create_hand`
Unfortunately i do not know how to play this game, thus it's not fully developed

### 2. Generating Identicon
1. `cd identicon`
2. `mix deps.get`
3. `iex -S mix`
4. `Identicon.main("Sky")` 

you can change the `Sky` to any other name, the identicon isnt generated randomly, it's generated according to the input.    
In other words, each input will generate a unique identicon
