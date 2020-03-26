class Hero
  attr_accessor :x,:y
  def initialize

    @tile_size = 48
    @hero = Character.new("gfx/character/farmer.png", @tile_size, @tile_size)
    @hero_wait = Hash.new
    @hero_wait[0] = Image.load_tiles("gfx/character/stand_1.png", @tile_size, @tile_size, retro: true)
    @hero_wait[1] = Image.load_tiles("gfx/character/stand_2.png", @tile_size, @tile_size, retro: true)
    @hero_houe = Character.new("gfx/character/houe.png", @tile_size, @tile_size)

    @wait_anim = rand(@hero_wait.size-1)

    @dir = "down"
    @move = false

    @stand = false
    @tick = 0
    @wait = 0

    @frame      = 0
    @frame_time = 0

    @x,@y,@z = 10,10,0

    @action = false
    @item = "houe"

  end

  def button_down(id)
    
    @wait = 0
    @stand = false
    if id == Gosu::KB_A and @action == false
      tick = 0
      @action = true 
      @hero_houe.frame = 0
      @hero_houe.end_anim = true
    end
   
  end

  def button_up(id)
    
  end


  def hero_wait
    if @wait >= 200
      @stand = true
      @frame_time += 1
      if @frame_time > 16
        @frame += 1 
        @frame_time = 0
        if @frame > @hero_wait[@wait_anim].size - 1
          @frame = 0
          @stand = false
          @wait = 0
          @wait_anim = rand(0..@hero_wait.size-1)
        end
      end 
    end
  end

  def hero_action
    
    @tick += 1
    case @item
    when "houe"
      if @hero_houe.end_anim == false 
        @tick = 0
        if @action == true
          case @dir
          when "up"
            $map[[@x/16,@y/16-1]][0]=4
          when "down"
            $map[[@x/16,@y/16+1]][0]=4
          when "left"
            $map[[@x/16-1,@y/16]][0]=4
          when "right"
            $map[[@x/16+1,@y/16]][0]=4
          end
        end
        @action = false
       

      end
    end
  end

  def hero_move
    if button_down? KB_UP
      @dir = "up"
      @move = true
      @y -= 1
      @wait = 0
    elsif button_down? KB_DOWN
      @dir = "down"
      @move = true
      @y += 1
      @wait = 0
    elsif button_down? KB_LEFT
      @dir = "left"
      @move = true
      @x -= 1
      @wait = 0
    elsif button_down? KB_RIGHT
      @dir = "right"
      @move = true
      @x += 1
      @wait = 0
    else
      @move = false
      @wait += 1
    end
  end

  def update
    @hero.anim
    @hero_houe.anim(20,true)

    hero_move if @action == false
    hero_wait
    hero_action

  end

  def draw_hero(x,y,z)
    if @stand == true
      @hero_wait[@wait_anim][@frame].draw(x,y,z)
    else
      if @action
        case @item
        when "houe"
          @hero_houe.draw(x,y,z,@dir,true)
        end
      else
        @hero.draw(x,y,z,@dir,@move)
      end
    end
  end

  def draw
    draw_hero(@x-@tile_size/2,@y-@tile_size/2,@z)
  end
end


