class Player < ActiveRecord::Base
  NAMES = ["Antonio", "José", "Manuel", "Francisco", "Juan",
    "David", "José Antonio",  "José Luis", "Jesús", "Javier",
    "Carlos", "Miguel", "Pedro", "Rafael", "José Manuel",
    "Ángel", "Daniel", "Francisco Javier", "Luis", "Fernando",
    "Miguel Ángel", "José María", "Alejandro", "Sergio",
    "Alberto", "Jorge", "Pablo", "Juan José", "Juan Carlos",
    "Ramón", "Vicente", "Enrique", "Juan Antonio", "Joaquin",
    "Andrés", "Diego", "Raúl", "Santiago", "Juan Manuel",
    "Eduardo", "Óscar", "Álvaro", "Rubén", "Iván", "Adrián",
    "Alfonso", "Salvador", "Roberto", "Jaime", "Francisco José"
  ]
  SURNAMES = [ "Abascal", "Abellán", "Acosta", "Álvarez", 
    "Arroyo", "Bauzà", "Bayo", "Belmonte", "Beltrán", "Bou", 
    "Cabrera", "Calzada", "Cordero", "Dalmau", "Díaz", 
    "Durán", "Echevarría", "Egea", "Esteban", "Fernández",
    "Fuster", "García", "Gallego", "Guzmán", "Huguet",
    "Iborra", "Iriarte", "Jover", "Landa", "Lobo", "Losa",
    "Macías", "Narváez", "Nogués", "Ochoa", "Otero", "Palomar",
    "Planas", "Riera", "Rocha", "Saavedra", "Soria", "Tejera",
    "Tirado", "Valverde", "Villalobos", "Yáñez"
  ]
  POSITIONS = %i(goalkeeper defender midfielder striker)
  QUALITY_RANGE = 1..999

  belongs_to :team

  validates_presence_of :name, :surname, :position, 
    :quality
  validates_inclusion_of :position, in: POSITIONS
  validates_inclusion_of :quality, in: QUALITY_RANGE

  def set_default
    self.name ||= NAMES.sample
    self.surname ||= SURNAMES.sample
    self.position ||= POSITIONS.sample
    self.quality ||= QUALITY_RANGE.to_a.sample
    self
  end

  class << self
    def generate(*attributes)
      new(attributes).set_default
    end

    def generate!
      player = generate
      player.save!
      player
    end
  end
end
