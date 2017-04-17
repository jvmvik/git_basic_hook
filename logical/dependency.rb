#!/usr/bin/env ruby
#
# $>dependency
#
require 'yaml'
setting = YAML.load(File.read(__dir__ + '/dependency.yml'))
parent = /^\s*#{setting['parent']}/

# Direct graph
#  dependency => parent
@graph = setting['graph']

puts "Analyze dependency changes."

# Mark all files for recompile
marked = []

# Analyze git changes
`git diff --stat`.split("\n").each do |line|
  next unless line =~ parent
  file = line.split('|').first.strip
  dir = File.dirname(file).gsub(parent, '')
  
  @graph.each do |node|
    if node['dependency'].include? dir
      marked << node['path']
    end
  end  
end

if marked.size > 0
  puts "Found files to recompile:"
  marked.each do |path|
   puts " - #{path}"
  end
  exit 1
end

puts 'Nothing to recompile'
exit 0


