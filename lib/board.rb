class Board 
    attr_accessor :cells
    
    def initialize(cells = nil)
        self.cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def reset!
        self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    end

    def position(input)
        spot = input.to_i-1
        self.cells[spot]
    end

    def full? 
        self.cells.all? {|player| player == "O" || player == "X"}  #returns a boolean whether the spaces are full or not
    end

    def turn_count
        self.cells.count{|player| player == "X" || player == "O"}  #returns the number of elements that are X or O
    end

    def taken?(index)
        spot = index.to_i-1
        self.cells[spot] != " "
    end

    def valid_move?(index)
        spot = index.to_i-1
        !taken?(index) && spot.between?(0, 8) 
    end

    def update(index, player)
        spot = index.to_i-1
        self.cells[spot] = player.token if valid_move?(index)
    end

end