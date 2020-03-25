=begin
  

=end
class GenerateMap

  attr_accessor :map

  def initialize(size_x=40,size_y=40)

    @map = Hash.new
    for x in 0..size_x
      for y in 0..size_y
        @map[[x,y]] = 0,nil
      end
    end
    return @map
  end
   
end



class Map
  def initialize(window)

    @x,@y,@z = 0,0,0

    @tile_size = 16
    @tileset = Image.load_tiles('gfx/tileset/sol.png', @tile_size, @tile_size, retro: true)
    size_x,size_y=40,40

    @map = GenerateMap.new(size_x,size_y).map
    
    @hero = Hero.new
  end

  def button_down(id)
    @hero.button_down(id)
   
  end

  def button_up(id)
    
  end


  def update
    @hero.update
  end

  def draw

    @map.each do |coords, texture|
			x, y, = coords[0], coords[1]
			tile1,tile2 = texture[0],texture[1]
        if tile1 != nil
          @tileset[tile1].draw(@x+ x * @tile_size, @y + y * @tile_size, 0)
        end
        if tile2 != nil
          @tileset[tile2].draw(@x+x* @tile_size, @y+y * @tile_size, 10)
        end
		end


    @hero.draw
  end
end


