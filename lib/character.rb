class Character
  def initialize(filename,size_x = 16,size_y = 24)

    @character = Image.load_tiles(filename,size_x,size_y, retro: true)
    
  end

  def button_down(id)
    
   
  end

  def button_up(id)
    
  end


  def update
    
  end

  def draw(x,y,z,dir = "down",move=false)
    case dir
    when "up"
      if move 
        frame = 4 + Gosu::milliseconds / 200 % 4
      else
        frame = 4
      end
      @character[frame].draw(x,y,z)
    when "down"
      if move 
        frame = Gosu::milliseconds / 200 % 4
      else
        frame = 0
      end
      @character[frame].draw(x,y,z)
    when "left"
      if move 
        frame = 8 + Gosu::milliseconds / 200 % 4
      else
        frame = 8
      end
      @character[frame].draw(x,y,z)
    when "right"
      if move 
        frame = 12 + Gosu::milliseconds / 200 % 4
      else
        frame = 12
      end
      @character[frame].draw(x,y,z)
    end
  end

end


