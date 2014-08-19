#!/usr/bin/env ruby
require 'strscan'

def tokenizer(scanner)
  tokens = {
    'comment' => /\/\*.*\*\//m,
    'string' => /[a-zA-Z_-]+/,
    'colon' => /:/,
    'semicolon' => /;/,
    'newline' => /\n+/,
    'space' => /\s+/,
    'braces_begin' => /{/,
    'braces_end' => /}/,
    'brackets_begin' => /\(/,
    'brackets_end' => /\)/,
    'square_brackets_begin' => /\[/,
    'square_brackets_end' => /\]/,
  }

  tokens.each do |type, regex|
    result = scanner.scan(regex)
    return [type, result] unless result.nil?
  end

  return nil
end

# stdin
while line = STDIN.gets
  code ||= ""
  code += line
end

scanner = StringScanner.new(code)
while !scanner.eos?
  result = tokenizer(scanner)
  raise "Failed lexical analysis." if result.nil?
  p result
end
