require_relative 'board'
require_relative 'player'

class Game

    attr_accessor :board, :player1, :player2

        def initialize
            
            @players = []

            puts " "
            puts "Gamer 1, comment tu t'appelles ?"
            
            player_name = gets.chomp
            puts " "

            @player1 = Player.new(player_name, "X")
            @players << @player1
            @player1.value = "X"
            @current_player = @player1
            puts "Gamer 2, comment tu t'appelles ?"

            player_name = gets.chomp
            puts " "
            @player2 = Player.new(player_name, "O")
            @players << @player2
            @player2.value = "O"

            system('clear')
            
            puts "Bienvenue  #{player1.name} et #{player2.name}! "
            puts " "
            puts "#{player1.name}  jouera avec les  #{player1.value} et #{player2.name} jouera avec les #{player2.value}."
            puts " "
            puts "Voici un plateau de jeu vide en exemple :"
            puts " "
            
            @board = Board.new
            
        end
    
        def switch_player
            if @current_player == @player1
               @current_player = @player2
            else
              @current_player = @player1
            end
            system('clear')
          end
        
          def turn
              9.times do 
                if @board.victory? == false
                puts @board.display_board
                @board.play_turn(@current_player)
                switch_player
                else
                  break
                end
                #puts @board.display_board
            end
                if @board.victory? == true
                    puts "    #{@current_player.name} gagne !"
                    puts " "
                        else
                        puts "EGALITE"
                    end
                end
            
    

            def again
            puts "Écris 'Potatosaurusflex' si tu veux rejouer"
            new_game = gets.chomp.to_s
            if new_game == "Potatosaurusflex"
                game = Game.new
                game.turn
                game.again
                
            else 
                puts "Pas folichon dis donc!"
            end
        end
    end