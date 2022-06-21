#! /usr/bin/env ruby

class FileCopier
  def initialize(file:, from:, to:)
    @file, @from, @to = file, File.expand_path(from), File.expand_path(to)
  end

  def run(dry_run: false)

    puts "From Directory: #{colorize(@from, :bright_blue)}"
    puts "To Directory:   #{colorize(@to, :bright_blue)}"
    puts "Text File:      #{colorize(@file, :bright_blue)}"
    puts

    File.readlines(@file, chomp: true).each do |filename|
      puts "Checking for '#{colorize(filename, :bright_blue)}'"

      glob_path = File.join(@from, "#{filename}*")

      Dir[glob_path].each do |file|
        basename = File.basename(file)

        puts "  - Found #{colorize(basename, :magenta)}"

        unless dry_run
          FileUtils.cp(file, File.join(@to, basename))
        end
      end
    end

    puts
    puts "Done"
  end

  private

  def colorize(value, color)
    case color
      when :black then "\e[30m" + value.to_s + "\e[0m"
      when :red then "\e[31m" + value.to_s + "\e[0m"
      when :green then "\e[32m" + value.to_s + "\e[0m"
      when :yellow then "\e[33m" + value.to_s + "\e[0m"
      when :blue then "\e[34m" + value.to_s + "\e[0m"
      when :magenta then "\e[35m" + value.to_s + "\e[0m"
      when :cyan then "\e[36m" + value.to_s + "\e[0m"
      when :white then "\e[37m" + value.to_s + "\e[0m"
      when :bright_black then "\e[1m\e[30m" + value.to_s + "\e[0m"
      when :bright_red then "\e[1m\e[31m" + value.to_s + "\e[0m"
      when :bright_green then "\e[1m\e[32m" + value.to_s + "\e[0m"
      when :bright_yellow then "\e[1m\e[33m" + value.to_s + "\e[0m"
      when :bright_blue then "\e[1m\e[34m" + value.to_s + "\e[0m"
      when :bright_magenta then "\e[1m\e[35m" + value.to_s + "\e[0m"
      when :bright_cyan then "\e[1m\e[36m" + value.to_s + "\e[0m"
      when :bright_white then "\e[1m\e[37m" + value.to_s + "\e[0m"
      else value.to_s
    end
  end
end

file_path      = ARGV[0]
from_directory = ARGV[1]
to_directory   = ARGV[2]
dry_run        = ARGV[3] == "--dryrun"

FileCopier.new(file: file_path, from: from_directory, to: to_directory).run(dry_run: dry_run)
