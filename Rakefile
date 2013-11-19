require "bundler/gem_tasks"

$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Espectativas de la clase madre Matriz"
task :test do
        sh "rspec -I. spec/matriz_spec.rb --format documentation"
end

desc "Pruebas unitarias de las clases hijas Matriz_Densa y Matriz_Dispersa"
task :tc do
        sh "ruby -I. test/tc_matriz.rb --format documentation"
end
