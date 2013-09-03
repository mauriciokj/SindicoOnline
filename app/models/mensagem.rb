class Mensagem < ActiveRecord::Base
  attr_accessible :de, :lida, :mensagem, :para
  belongs_to :de, :class_name => "Apartamento", :foreign_key => "de"
  belongs_to :para, :class_name => "Apartamento", :foreign_key => "para"


  	scope :nao_lidas, lambda {
		{
			:conditions => ['lida = ? or lida is ?', false, nil]
		}
	}

  	scope :lidas, lambda {
		{
			:conditions => ['lida = ?', true]
		}
	}
  
end
