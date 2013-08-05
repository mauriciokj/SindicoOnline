# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
inflect.irregular 'ApartamentoLeitura', 'ApartamentosLeituras'
inflect.irregular 'apartamento_leitura', 'apartamentos_leituras'
inflect.irregular 'imovel', 'imoveis'
inflect.irregular 'conta', 'contas'
inflect.irregular 'conta_por_apartamento', 'contas_por_apartamentos'
inflect.irregular 'ContaPorApartamento', 'ContasPorApartamentos'

#   inflect.uncountable %w( fish sheep )
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
