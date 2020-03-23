require "rubygems"
require 'json'
require 'gosu'

include Gosu

require_relative 'lib/map.rb'
require_relative 'lib/character.rb'
require_relative 'lib/hero.rb'

class Game < Window
  def initialize(params = {})
    # default values
    params[:width]       ||= 640
    params[:height]      ||= 480
    params[:fullscreen]  ||= false
    params[:caption]     ||= 'Cid le fermier'
    params[:show_cursor] ||= true
    params[:escape_key]  ||= Gosu::KB_ESCAPE
    params[:resizable]   ||= true

    # we store the show_cursor state and escape key(s) for callback methods below
    @show_cursor = params[:show_cursor]
    @escape_key  = params[:escape_key]
    @resizable	 = params[:resizable]

    # Gosu window setup
    super(params[:width], params[:height], {fullscreen: params[:fullscreen],resizable: params[:resizable]})

    self.caption = params[:caption]
    @font = Gosu::Font.new(24)
    @main_state = Map.new(self)
  end

  def needs_cursor?; true; end

  def button_down(id)
    super
    @main_state.button_down(id)
    close! if id == Gosu::KB_ESCAPE
  end

  def button_up(id)
    @main_state.button_up(id)
  end


  def update
    @main_state.update
  end

  def draw
    scale(4,4)do
      @main_state.draw
    end
  end
end

Game.new.show
