require 'matriz.rb'
require 'matriz_densa.rb'

module Prct09
  class Matriz_Dispersa < Matriz

    def new_initialize
      @pos = Array.new(@filas)
      i = 0
      while(i < @filas)
        @pos[i] = {} 
        i += 1
      end
    end

    def initialize(filas, columnas)
      super
      new_initialize
    end


  # Metodo Creacion de la matriz dispersa
    def self.copy(matriz)

    obj = new(matriz.filas, matriz.columnas)

    i = 0
    while(i < matriz.filas)
      j = 0
      while(j < matriz.columnas)
        val = matriz.get(i,j)
        if(val != 0)
          obj.pos[i][j] = val
          end
        j += 1
      end
      i += 1
    end
    obj
    end

 # Get (Devuelve el valor del elemento guardado en i,j)
    def get(i, j)
      if(@pos[i][j] != nil)
        return @pos[i][j]
      else
        return 0
      end
    end
 # Set (Modifica el valor del elemento guardado en i,j)

    def set(i, j, val)
      if(val == nil or val == 0)
        @pos[i].delete(j)
      else
        @pos[i][j] = val
      end
    end

# Porcentaje de numeros nulos

     def num_nulos
       t = @filas*@columnas
       nn = 0

       i = 0
       while(i < @filas)
         nn += @pos[i].size
         i += 1
       end

       n = t - nn
       n.to_f/t.to_f
     end

#Definicion del metodo to_s  

def to_s
      i = 0
      output = ""
      while(i < @filas)
        output += "Fila #{i}: "
        @pos[i].sort.each{|k, v| output += "#{k}=>#{v} "}
        output += "\n"
        i += 1
      end
      output
    end

#Metodo Suma

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

      if(c.num_nulos > 0.6)
        c = Matriz_Dispersa.copy(c)
      end
      c
    end

#Metodo Resta

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

      if(c.num_nulos > 0.6)
        c = Matriz_Dispersa.copy(c)
      end
      c
    end

#Metodo Multiplicacion

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

    if(c.num_nulos > 0.6)
      c = Matriz_Dispersa.copy(c)
    end
    c
    end

#Metodo Comparacion
    def <=>(other)
	cont =0
        
	for i in 0 ... @filas
	  for j in 0 ... @columnas  
	     if((pos[i][j] != nil)&&(other.pos[i][j]!=nil))
	         cont=cont+(pos[i][j] <=> other.pos[i][j])
	     elsif((pos[i][j]!=nil)&&(other.pos[i][j]==nil))
	         if(pos[i][j]<0)
	            cont=cont-1
	         else
	            cont=cont+1
	         end
	     elsif ((pos[i][j]==nil)&&(other.pos[i][j]!=nil))
		 if(other.pos[i][j]>0)
                    cont=cont-1
                 else
                    cont=cont+1
                 end
	     end	
	end	
    end   
     if cont > 0
	cont = 1
     elsif
	cont = -1  
    end
  cont 
  end        
 
 end
end


