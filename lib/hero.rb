class Hero
  def initialize

    @hero = Character.new("gfx/character/farmer.png", 16, 24)
    @hero_wait = Image.load_tiles("gfx/character/stand_1.png", 16, 24, retro: true)
    @dir = "down"
    @move = false
    @stand = false
    @tick = 0
    @wait = 0
    @x,@y,@z = 10,10,0

  end

  def button_down(id)
    
   
  end

  def button_up(id)
    
  end

  def hero_wait(x,y,z)
    @hero_wait[Gosu::milliseconds / 300 % (@hero_wait.size-1)].draw(x,y,z)
  end


  def update

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
     if @wait >= 1000
      @tick += 1
      @stand = true
      if @tick >= 150 
        @tick = 0
        @stand = false
        @wait = 0
      end
    end
    puts @wait
  end

  def draw
    if @stand == true
      hero_wait(@x,@y,@z)
    else
      @hero.draw(@x,@y,@z,@dir,@move)
    end
  end

end


