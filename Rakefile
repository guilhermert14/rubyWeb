
desc 'Execute scenarios'

task :allChrome do

puts 'Running all scenarios in chrome browser'

sh 'cucumber chrome=true extra=true & cucumber chrome=true ponto_frio=true & cucumber chrome=true casas_bahia=true'

end

task :allFirefox do
   sh 'cucumber firefox=true extra=true & cucumber firefox=true ponto_frio=true & cucumber firefox=true casas_bahia=true'
end

desc 'Execute all scenarios remote of multicanalidade team in env 209 casas bahia site'
task :all_multicanal_team_209 do
  sh 'cucumber remote=true features\multicanalidade\* casasbahia=true 209=true'
end

desc 'Execute all scenarios remote of multicanalidade team in env 28 casas bahia site'
task :all_multicanal_team_28 do
  sh 'cucumber remote=true features\multicanalidade\* casasbahia=true 28=true'
end

desc 'Execute all scenarios remote of multicanalidade team in env Prod casas bahia site'
task :all_multicanal_team do
  sh 'cucumber remote=true features\multicanalidade\* casasbahia=true'
end

desc 'Execute all scenarios remote of catalogo team in env 209 casas bahia site'
task :all_catalogo_team_209 do
  sh 'cucumber remote=true features\catalogo\* casasbahia=true 209=true'
end

desc 'Execute all scenarios remote of catalogo team in env 28 casas bahia site'
task :all_catalogo_team_28 do
  sh 'cucumber remote=true features\catalogo\* casasbahia=true 28=true'
end

desc 'Execute all scenarios remote of catalogo team in env 209 casas bahia site'
task :all_catalogo_team do
  sh 'cucumber remote=true features\catalogo\* casasbahia=true'
end
