require "./lib/prct09/gcd.rb"

module Prct09
  class Fraccion
    # Módulos usados
    include Comparable

    # Métodos principales
      def initialize(x,y)
          @num, @den = x, y
          reducir
      end

      def to_s
          "#{@num}/#{@den}"
      end

end
end
