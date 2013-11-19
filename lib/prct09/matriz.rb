require './lib/prct09/racional.rb'

module Prct09
  class Matriz
    attr_reader :filas, :columnas
    attr_accessor :pos

    def initialize(filas, columnas)
      @filas=filas
      @columnas=columnas
    end

  end
end

