=begin
  
=end

class GenerateMap

  attr_accessor :map

  def initialize
    @tileset = Image.load_tiles('gfx/tileset/sol.png', 16, 16)
  end

  def draw(pos_x=0,pos_y=0,z=0)
    
  end

   
end

class Map
  def initialize(window)
    @map = GenerateMap.new
    @hero = Hero.new
  end

  def button_down(id)
    
   
  end

  def button_up(id)
    
  end


  def update
    @hero.update
  end

  def draw
    @map.draw
    @hero.draw
  end
end


