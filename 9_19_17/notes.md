### Hashketball

  * big_shoe_rebounds
    * can use ```max``` method on
    * compare and set to variable while iterating
    * create helper methods - ex: ```def players``` and ```def biggest_shoe_size```
    * can call ```.fetch``` on the hash - ex: ```game_hash.fetch(:home).fetch(:players)```
      ```Ruby
      def players
        #get list of all players
        home_players = game_hash.fetch(:home).fetch(:players)
        away_players = game_hash.fetch(:away).fetch(:players)

        home_players + away_players
      end

      def player_biggest_shoe_size
        players.sort_by {|player| player[:shoe]}.last
      end

      player_biggest_shoe_size[:rebounds]
      ```
    * get array with all the players in order to iterate over 1 array rather than nesting iteration

### Stars Wars

  * require 'rest-client' and 'json'


### Review

  * Enumerable
