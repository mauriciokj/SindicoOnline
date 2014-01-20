namespace :error_generate do

	desc "Gerando view de erro argumentos (objeto, div, pasta)"
	task :views, [] => :environment do |t, args|
		objeto =  ENV['objeto']
		action =  ENV['action'] || "save_#{objeto}"
		pasta =  ENV['pasta'] || ENV['objeto'].pluralize 
		div = ENV['div'] || "error"
		dir =  Dir.pwd + "/app/views/#{pasta}/"
		puts "#################################################"
		puts "copie o código dentro de sua action no controller"
		puts "render :action => #{action}, formats: [:js]"
		puts "#################################################"

		File.open(dir + "#{action}.js.erb", "w+") { |file| file.write(
			"$('##{div}').html('<%= escape_javascript(render(:partial => '#{pasta}/errors', :locals => {:#{objeto} => @#{objeto}}))%>')"
			) }

		File.open(dir + "_error_#{objeto}.erb", "w+") { |file| file.write(" 
		 <div id='error_explanation'  class='alert alert-error'>
			<h4>
				<%= pluralize(#{objeto}.errors.count, 'erro') %> ao realizar ação:
			</h4>
			<ul>
				<% #{objeto}.errors.full_messages.each do |msg| %>
					<li><%= msg %></li>
				<% end %>
			</ul>
		</div>
		<%= bootstrap_flash %>") }

		
	end
end
