class Character
  attr_accessor :frame, :end_anim
  def initialize(filename,size_x = 16,size_y = 24)

    @character = Image.load_tiles(filename,size_x,size_y, retro: true)
    @frame      = 0
    @frame_time = 0
    @end_anim = true
  end

  def anim(time = 12,auto_anim = false)

    keys = [Gosu::KB_W, Gosu::KB_A, Gosu::KB_Q, Gosu::KB_S, Gosu::KB_D, Gosu::KB_LEFT, Gosu::KB_RIGHT, Gosu::KB_UP, Gosu::KB_DOWN]
    if auto_anim == true
      @frame_time += 1
      if @frame_time > time
        @frame += 1 
        @frame_time = 0
        @end_anim = false if @frame > @character.size/4 - 1
      end
    else
      unless keys.any? {|key| Gosu::button_down?(key)}
        @frame = 0
      else 
        @frame_time += 1
        if @frame_time > time
          @frame += 1 
          @frame_time = 0
          @frame = 0 if @frame > @character.size/4 - 1
        end 
      end
    end
  end

  def draw(x,y,z,dir = "down",move=false)
    case dir
    when "up"
      if move 
        frame = @character.size/4 + @frame
      else
        frame = @character.size/4
      end
      @character[frame].draw(x,y,z)
    when "down"
      if move 
        frame = @frame
      else
        frame = 0
      end
      @character[frame].draw(x,y,z)
    when "left"
      if move 
        frame = (@character.size/4)*2 + @frame
      else
        frame = (@character.size/4)*2
      end
      @character[frame].draw(x,y,z)
    when "right"
      if move 
        frame = (@character.size/4)*3 + @frame
      else
        frame = (@character.size/4)*3
      end
      @character[frame].draw(x,y,z)
    end
  end

end


