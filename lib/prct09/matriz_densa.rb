require "./lib/prct09/matriz.rb"


module Prct09

  class Matriz_Densa < Matriz

    # Initialize 
    def initialize(filas, columnas)
      super
      @pos = Array.new(@filas,0)
      i = 0
      while i < @filas
        @pos[i] = Array.new(@columnas,0)
        i += 1
      end
    end


 # Get (Devuelve el valor del elemento guardado en i,j)
    def get(i, j)
      @pos[i][j]
    end

 # Set (Modifica el valor del elemento guardado en i,j)
    def set(i, j, val)
      @pos[i][j] = val
    end

 # Porcentaje de numeros nulos
    def num_nulos
      total = @filas*@columnas
      nn = 0

      i = 0
       while(i < @filas)
         j = 0
         while(j < @columnas)
           if(@pos[i][j] != 0)
             nn += 1
           end
           j += 1
         end
         i += 1
       end

      n = total - nn

      n.to_f/total.to_f
    end

#Definicion del metodo to_s  
    def to_s
      s = ""
      i = 0
      while(i < @filas)
        j = 0
        while(j < @columnas)
          s += "#{@pos[i][j].to_s} "
          j += 1
        end
        puts " "
        i += 1
      end
      s
    end


 # Metodo Suma
    def +(other)
      c = Matriz_Densa.new(@filas, @columnas)
      i = 0
      while(i < @filas)
        j = 0
        while(j < @columnas)
          c.set(i, j, get(i,j) + other.get(i,j))
          j += 1
        end
        i += 1
      end
      c
    end

# Metodo Resta        
    def -(other)
      c = Matriz_Densa.new(@filas, @columnas)
      i = 0
      while(i < @filas)
        j = 0
        while(j < @columnas)
          c.set(i, j, get(i,j) - other.get(i,j))
          j += 1
        end
        i += 1
      end
      c
    end

# Metodo Multiplicacion
    def *(other)
        c = Matriz_Densa.new(@filas, other.columnas)
        i = 0
        while(i < @filas)
          j = 0
          while(j < other.columnas)
            k = 0
            while(k < @columnas)
              c.set(i, j, get(i, k) * other.get(k,j) + c.get(i,j))
              k += 1
            end 
          j += 1
          end
        i += 1
        end
        c
    end


#Metodo Comparacion
#Busqueda del maximo
    def max
        m = get(0,0)
        i = 0
        while(i < @filas)
                j = 0
                while(j < @columnas)
                        if (get(i,j) > m)
                                m = get(i,j)
                        end
                        j += 1
                end
                i += 1
        end
        m
    end

#Busqueda del minimo
    def min
        m = get(0,0)
        i = 0
        while(i < @filas)
                j = 0
                while(j < @columnas)
                        if (get(i,j) < m)
                                m = get(i,j)
                        end
                        j += 1
                end
                i += 1
        end
        m
    end
 
 end
end
